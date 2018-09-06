# The Whiteflag Protocol

## Protocol Specification
The [whiteflag-standard repository](https://github.com/WhiteflagProtocol/whiteflag-standard) contains the officially released versions of the Whiteflag Protocol specification as an open standard, including a number of supporting artefacts.

The purpose of the Whiteflag Protocol is to provide an open, real-time, trusted communication channel between any or all parties in an armed conflict, without the requirement for a trusted third party or any specific software or system. It is the intention to provide a means of communication to be used in armed conflicts that is fast, reliable and accessible by everyone, in addition to internal communications within organisations and in addition to any currently existing but limited communication methods such as flags, signs, registers etc.

The purpose of this project repository is to describe, define and publish the communications protocol and associated message format for policy makers, developers and other specialists to be able to adopt and implement the Whiteflag Protocol.

More technical background information can be found in the [Whiteflag specification wiki](https://github.com/WhiteflagProtocol/whiteflag-standard/wiki).

## Protocol Version
The current baselined version of the protocol is: **Version 1 Draft 6** or in short: `v1-draft.6`.

## Repository Structure
The main source document of the Whiteflag Protocol specification is `WhiteflagSpecification.md`.

Markdown is a plain text formatting syntax; see [RFC 7763](https://tools.ietf.org/html/rfc7763) or [Wikipedia](https://en.wikipedia.org/wiki/Markdown) for more information on this media type. Using Markdown allows the standard to be easily maintained and to be published in other formats, such as html or pdf.

For convenience, the standard is also available in an `html` and in a `pdf` format. These documents were generated from the markdown source document with [pandoc](https://pandoc.org/).

Along with the standard, a JSON schema of the Whiteflag message structure, message syntax and message codes is available as `WhiteflagMessageSchema.json`. This artefact describes parts of the specification in a structured language ([JSON](https://tools.ietf.org/html/rfc7159)). This allows for fast and interoperable implementation of the standard.

## Configuration Management
A foundation will be established for the maintenance, promotion and support of the Whiteflag Protocol. While the foundation is founded and a configuration process for this specification as an open standard is put in place, issues may be raised and discussed in this project repository, and will be openly considered by the original authors.
