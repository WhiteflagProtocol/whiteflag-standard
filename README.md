# Whiteflag Protocol specification
This repository contains the official Whiteflag Protocol specification, including a number of supporting artefacts.

## Background of Whiteflag
The Whiteflag Protocol is a standard for a digital communications protocol based on blockchain technology, to provide an open, real-time, reliable communication channel between any or all parties in an armed conflict, without the requirement for a trusted third party or any specific software or system. It is intended to be fast, reliable and accessible by everyone, in addition to internal communications within organisations and in addition to any currently existing but limited communication methods such as flags, physical signs, registers etc. Whiteflag can also be used to communicate information about natural and man-made disasters, thus creating shared situational awareness beyond conflicts.

All in all, the protocol forms the basis for an uncontrolled and open network, the Whiteflag Messaging Network, for trusted real-time messaging between parties in conflict and disaster response situations.

## Purpose of this project repository
The purpose of this project repository is to describe, define and publish the communications protocol and associated message format for policy makers, developers and other specialists to be able to adopt and implement the Whiteflag Protocol.

## Repository structure
The official source document of the Whiteflag Protocol specification, a.k.a. "the standard", is `Specification_WF_Protocol.md`. This document is currently under review before it will be uploaded as a markdown text file to this repository.

Markdown is a plain text formatting syntax; see [RFC 7763](https://tools.ietf.org/html/rfc7763) or [Wikipedia](https://en.wikipedia.org/wiki/Markdown) for more information on this media type. Using Markdown allows the standard to be easily maintained and to be published in other formats, such as html or pdf.

Along with the standard, a number of artefacts with parts of the specification described in a structured language ([JSON](https://tools.ietf.org/html/rfc7159)) will be published. This allows for fast and interoperable implementation. The following artefacts are planned to be made available:

* `wf.message.schema.json`: JSON schema of the Whiteflag message structure and field syntax
* `wf.referencecodes.json`: JSON object containing allowed referencing between reference codes of Whiteflag messages
* `wf.typereferences.json`: JSON object containing allowed reference types between Whiteflag messages

## Versioning
[Semantic versioning](https://semver.org/) is used for the Whiteflag specification.

## License and Usage
The Whiteflag specification will probably be published under a [Creative Commons CC0](http://creativecommons.org/publicdomain/zero/1.0/) statement, meaning that to the extent possible under law, the original authors and their organisations have waived all copyright and related or neighboring rights to this work, allowing anyone to copy, modify, distribute and implement the work, even for commercial purposes, all without asking permission.

## Configuration Control
It is foreseen that this standard requires updates in the near future as a result of validation and to ensure compatibility with emerging blockchain practices, paradigms and standards. However, an appropriate configuration process for this this specification as an open standard is still under consideration. For the time being, issues may be raised and discussed in this project repository, and will be openly considered by the original authors.
