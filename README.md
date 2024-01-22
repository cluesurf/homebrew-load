
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

<h3 align='center'>@termsurf/task</h3>
<p align='center'>
  Common Actions Interface
</p>

<br/>
<br/>
<br/>

## Summary

Task is a collections of common actions to perform in code. Here are some immediately helpful resources:

- [`ghcr.io/termsurf/task` Docker image](https://ghcr.io/termsurf/task)

The `task` JavaScript/TypeScript library has these features:

- CLI
- Programmatic Browser API (for where we can do browser tasks)
- Programmatic Node.js API (for everything)

## Installing the Library

Requirements on Mac:

```bash
brew tap termsurf/task
```

To use `docx2pdf` you need to have the Microsoft Word app installed on your machine as well.

Requirements for Windows:

```
choco install libreoffice-fresh
choco install imagemagick --version 7.0.10.19
choco install fontforge
choco install ffmpeg
choco install miktex
choco install nodejs
```

Requirements for Linux:

```
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install texlive-xetex
sudo apt-get install imagemagick
sudo apt-get install libreoffice
sudo apt-get install fontforge
sudo apt-get install inkscape
sudo apt-get install ffmpeg
sudo apt-get install ufraw
sudo apt-get install rar
```

Finally, with these dependencies installed, you can install the act:

```
npm install -g @termsurf/task
```

## Creating Your Own Docker Image

You can link to the Docker image at [`ghcr.io/termsurf/task`](https://ghcr.io/termsurf/task) like this sample `Dockerfile` shows:

```Dockerfile
FROM --platform=linux/amd64 ghcr.io/termsurf/task:latest
RUN mkdir -p /home/app
WORKDIR /home/app
ENV PORT 3000
COPY *.yaml .
COPY *.json .
RUN pnpm install
COPY src/ src
EXPOSE ${PORT}
CMD [ "sh", "-c", "pnpm start"]
```

## Development

This codebase is built around TypeScript, Node.js/Browser, pnpm, and zod for parsing JSON input. All central functions should have an object passed as input, which zod parses and validates. We automatically generate the zod types using `pnpm tsx make`, which reads from `code/shared/type/source` for a bunch of "type" definitions written in JavaScript/JSON, and it then takes those definitions and generates TypeScript types and zod parsers. This way we don't have to write 2 or 3 times the same type definition (once in TypeScript, once in zod, once for an API somewhere else, etc.), you just write the source types, and it generates the types from that.

Then there are 3 parts:

1. Node.js API
2. CLI
3. Browser API (not really started yet)

The Node.js API is all Promise based, using the object input pattern. The CLI wraps that Node.js interface and logs some stuff to the terminal, not too much.

To setup the command locally, just do `pnpm link -g`.

### Adding a new Task

To add a new task, just place it in either of the shared/node/browser folders, and add a source type definition for the input. Run `pnpm tsx make` to generate the types. Then just write the code to implement the command. If the command invokes a CLI tool, you can create two functions:

1. Build the command.
2. Run the command.

The building part just creates an array of CLI arguments. The Run command takes those args and runs them and interprets any CLI output if there is some.

There are some basic tests against files in the `test` directory, just manual tests pretty much at the moment.

You don't need to run Docker to develop this, you can just install the tools on your computer to develop locally.

## TODO

- add unarchive commands
- add archive creation commands
- add decompress commands
- add compress commands
- add format commands
- add compile commands
- add spreadsheet conversion

## License

MIT
