#!/usr/bin/env tsx
/**
 * Sync Casks/rock.rb with the current state of ../rock.
 *
 * Reads version from ../rock/base/package.json and sha256
 * from the locally built zip in ../rock/base/dist/. Rewrites
 * the `version` and `sha256` lines of Casks/rock.rb in place.
 *
 * Run from this repo root:
 *
 *     pnpm sync:rock
 *
 * The URL line in the cask uses `#{version}` interpolation
 * so it follows the version automatically. Nothing else
 * needs editing.
 *
 * If the zip is missing, the script tells you how to build
 * it. It does NOT publish, commit, or push. That's a
 * separate step.
 */

import { createHash } from 'node:crypto'
import { readdir, readFile, stat, writeFile } from 'node:fs/promises'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'

const HERE = dirname(fileURLToPath(import.meta.url))
const ROOT = join(HERE, '..')
const ROCK = join(ROOT, '..', 'rock')
const CASK = join(ROOT, 'Casks', 'rock.rb')

async function readVersion(): Promise<string> {
  const path = join(ROCK, 'base', 'package.json')
  const text = await readFile(path, 'utf8')
  const json = JSON.parse(text) as { version?: unknown }
  if (typeof json.version !== 'string' || json.version.length === 0) {
    throw new Error(`${path} has no string \`version\` field`)
  }
  return json.version
}

async function findZip(version: string): Promise<string> {
  const distDir = join(ROCK, 'base', 'dist')
  try {
    await stat(distDir)
  } catch {
    throw new Error(
      `Build directory not found at ${distDir}.\n` +
        `Build Rock.app first:\n  cd ../rock && pnpm package:mac`,
    )
  }

  const entries = await readdir(distDir)
  const matches = entries
    .filter(name => name.startsWith('Rock-'))
    .filter(name => name.includes(version))
    .filter(name => name.endsWith('-mac.zip'))

  if (matches.length === 0) {
    throw new Error(
      `No zip matching Rock-*${version}*mac.zip in ${distDir}.\n` +
        `Build Rock.app first:\n  cd ../rock && pnpm package:mac`,
    )
  }
  // Prefer the arm64 slice — the cask URL template hardcodes
  // `Rock-#{version}-arm64-mac.zip`, so its hash is the one
  // that must match. electron-builder also emits a generic
  // `Rock-<v>-mac.zip` (x64) on universal builds; ignore that.
  const preferred =
    matches.find(name => name.endsWith('-arm64-mac.zip')) ?? matches[0]
  return join(distDir, preferred)
}

async function hashFile(path: string): Promise<string> {
  const buf = await readFile(path)
  return createHash('sha256').update(buf).digest('hex')
}

function rewriteCask(text: string, version: string, sha: string): string {
  // Each replacement matches the directive at line start regardless
  // of the right-hand-side shape — handles both `sha256 :no_check`
  // (Ruby symbol) and `sha256 "abc..."` (string).
  let out = text
  out = out.replace(
    /^(\s*version\s+).*$/m,
    (_match, lead: string) => `${lead}"${version}"`,
  )
  out = out.replace(
    /^(\s*sha256\s+).*$/m,
    (_match, lead: string) => `${lead}"${sha}"`,
  )
  return out
}

async function main(): Promise<void> {
  const version = await readVersion()
  const zip = await findZip(version)
  const sha = await hashFile(zip)

  console.log(`rock version: ${version}`)
  console.log(`zip:          ${zip.replace(ROOT + '/', '')}`)
  console.log(`sha256:       ${sha}`)

  const cask = await readFile(CASK, 'utf8')
  const next = rewriteCask(cask, version, sha)

  if (next === cask) {
    console.log('\nCasks/rock.rb already in sync.')
    return
  }
  await writeFile(CASK, next)
  console.log(`\nWrote ${CASK.replace(ROOT + '/', '')}.`)
  console.log('Review the diff, then commit + push when ready:')
  console.log('  git add Casks/rock.rb')
  console.log(`  git commit -m "rock: ${version}"`)
  console.log('  git push')
}

await main()
