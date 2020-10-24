# The Whiteflag Protocol

## Protocol Specification

The purpose of [Whiteflag](https://www.whiteflagprotocol.org/)
is to provide an open and decentralised communications protocol to create
a trusted messaging network for disaster & conflict zones, without the
requirement for a trusted third party or any specific software or system.

The Whiteflag Protocol is an [open standard](https://en.wikipedia.org/wiki/Open_standard)
for a blockchain-based communications protocol that is trusted and accessible
by all parties involved armed conflicts, in addition to any currently existing
but limited or unsecure communication methods such as telephone, e-mail,
messaging, physical signs, registers etc.

The Whiteflag specification is released in the [public domain](https://en.wikipedia.org/wiki/Public_domain).
Please read the [license](https://github.com/WhiteflagProtocol/whiteflag-standard/blob/master/LICENSE.md)
for more detailed information.

## Protocol Version and Publication

The current baselined version of the protocol is:
**Version 1 Draft 6** or in short: `v1-draft.6`.

## Repository Structure

This GitHub repository contains the official, configuration controlled versions
of Whiteflag specification. The main source document with the protocol
specification is `WhiteflagSpecification.md`.

This is a markdown document. Markdown is a plain text formatting syntax;
see [RFC 7763](https://tools.ietf.org/html/rfc7763) or [Wikipedia](https://en.wikipedia.org/wiki/Markdown)
for more information on this media type. Using Markdown allows the standard to
be easily maintained and to be published in other formats, such as html or pdf.

Documents in these formats are generated from the markdown source document with
[pandoc](https://pandoc.org/) and published in the `docs/` directory.

The `docs/` directory is published on <https://standard.whiteflagprotocol.org>
using GitHub pages.

Along with the standard, a JSON schema of the Whiteflag message structure,
message syntax and message codes is available as `WhiteflagMessageSchema.json`.
This artefact describes parts of the specification in a structured language,
i.e. the [JSON](https://tools.ietf.org/html/rfc7159) format. This allows for
fast and interoperable implementation of the standard.

## Configuration Management

The [Whiteflag Foundation](https://www.whiteflagprotocol.org/foundation)
maintenans, promotes and supports adoption of the Whiteflag Protocol.
While the foundation is established and a configuration process for the
specification as an open standard is put in place, issues may be raised
and discussed in this project repository, and will be openly considered
by the original authors.
