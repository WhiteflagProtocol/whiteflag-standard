# The Whiteflag Protocol

## Protocol Specification
The [whiteflag-standard repository](https://github.com/WhiteflagProtocol/whiteflag-standard) contains the officially released versions of the Whiteflag Protocol specification as an open standard, including a number of supporting artefacts.

The purpose of the Whiteflag Protocol is to provide an open, real-time, trusted communication channel between any or all parties in an armed conflict, without the requirement for a trusted third party or any specific software or system. It is the intention to provide a means of communication to be used in armed conflicts that is fast, reliable and accessible by everyone, in addition to internal communications within organisations and in addition to any currently existing but limited communication methods such as flags, signs, registers etc.

The purpose of this project repository is to describe, define and publish the communications protocol and associated message format for policy makers, developers and other specialists to be able to adopt and implement the Whiteflag Protocol.

More technical background information can be found in the [Whiteflag specification wiki](https://github.com/WhiteflagProtocol/whiteflag-standard/wiki).

## Repository Structure
The main source document of the Whiteflag Protocol specification is `WhiteflagSpecification.md`.

Markdown is a plain text formatting syntax; see [RFC 7763](https://tools.ietf.org/html/rfc7763) or [Wikipedia](https://en.wikipedia.org/wiki/Markdown) for more information on this media type. Using Markdown allows the standard to be easily maintained and to be published in other formats, such as html or pdf.

Along with the standard, a number of artefacts with parts of the specification described in a structured language ([JSON](https://tools.ietf.org/html/rfc7159)) will be published. This allows for fast and interoperable implementation. The following artefacts are currenlty available:

* `WhiteflagMessageSchema.json`: JSON schema of the Whiteflag message structure, message syntax and message codes

## Configuration Control
It is foreseen that this standard requires updates in the near future as a result of validation and to ensure compatibility with emerging blockchain practices, paradigms and standards. However, an appropriate configuration process for this this specification as an open standard is still under consideration. For the time being, issues may be raised and discussed in this project repository, and will be openly considered by the original authors.
