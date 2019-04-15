#!/bin/bash
##
## publish.sh
## Script using pandoc to publish the WF specification in a sepcific document format

# Check pandoc
if [[ ! -x $(which pandoc) ]]; then
    printf -- "Cannot find pandoc.\n"
    printf -- "Please check if pandoc is installed and the path is set correctly.\n"
    exit 1
fi

# Check if source file is specified
if [[ -z "${2}" ]]; then
    SOURCEDOC="../WhiteflagSpecification.md"
else
    SOURCEDOC="${2}"
fi

# Check arguments
if [[ -z "${1}" ]]; then
    printf -- "No format specified for the output document.\n"
    printf -- "Usage: %s [pdf | html ] [<sourcefile>]\n" ${0##*/}
    printf -- "Default <sourcefile>: %s.\n" ${SOURCEDOC}
    exit 1
else
    FORMAT="${1}"
fi

# Arguments have been checked; do not use unset variables from now
set -u

# Check if source document file exists
if [[ -e ${SOURCEDOC} ]]; then
    SRCDIR=$(dirname ${SOURCEDOC})
    SRCFILE=$(basename ${SOURCEDOC})
else
    printf -- "Source document %s does not exist.\n" ${2}
    exit 1
fi

# Check source document file extension
if [[ ${SOURCEDOC##*.} != "md" ]]; then
    printf -- "Source document %s does not have a markdown extension.\n" ${SOURCEDOC}
    exit 1
fi

# Compile output document name
VERSION=$(git describe --tags)
PUBDIR=${SRCDIR}
PUBFILE=${SRCFILE%.*}"-"${VERSION}"."${FORMAT}
OUTPUTDOC=${PUBDIR}"/"${PUBFILE}

# Call pandoc with options iaw format
case "${FORMAT}" in
    pdf)
        pandoc -s --template template.tex --variable=version:${VERSION} -o ${OUTPUTDOC} pdf.yaml ${SOURCEDOC}
        PANDOCEXIT=${?}
        ;;
    html)
        pandoc -s --variable=version:${VERSION} -o ${OUTPUTDOC} html.yaml ${SOURCEDOC}
        PANDOCEXIT=${?}
        ;;
    #docx)
    #    pandoc -s --reference-docx=template.docx --variable=version:${VERSION} -o ${OUTPUTDOC} ${SOURCEDOC}
    #    PANDOCEXIT=${?}
    #    ;;
    *)
        printf -- "Format %s is not supported.\n" ${FORMAT}
        exit 1
        ;;
esac

# Check success
if [[ ${PANDOCEXIT} == 0 ]]; then
    printf -- "Sucessfully created %s\n" ${OUTPUTDOC}
    exit 0
else
    printf -- "Could not create %s\n" ${OUTPUTDOC}
    exit ${PANDOCEXIT}
fi 

# We should not get here
exit -1
