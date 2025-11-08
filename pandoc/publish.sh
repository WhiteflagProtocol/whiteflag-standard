#!/bin/bash
##
## pandoc/publish.sh
## Script using pandoc to publish the WF specification in a sepcific document format
##

# Check arguments
if [[ -z "${1}" ]]; then
    printf -- "No format specified for the output document.\n"
    printf -- "Usage: %s [ pdf | html ] [<sourcefile>]\n" ${0##*/}
    exit 1
else
    FORMAT="${1}"
fi

# Source file
SOURCEDOC="../wf-specification.md"
if [[ -n "${2}" ]]; then
    SOURCEDOC="${2}"
fi

# Arguments have been checked; do not use unset variables from now
set -u

# Check if source document file exists
if [[ -e ${SOURCEDOC} ]]; then
    SRCDIR=$(dirname ${SOURCEDOC})
    SRCFILE=$(basename ${SOURCEDOC})
else
    printf -- "Source document %s does not exist.\n" ${SOURCEDOC}
    exit 1
fi

# Check pandoc
if [[ ! -x $(which pandoc) ]]; then
    printf -- "Cannot find pandoc; please check if pandoc is installed.\n"
    exit 1
fi

# Check source document file extension
if [[ ${SOURCEDOC##*.} != "md" ]]; then
    printf -- "Source document %s does not have a markdown extension.\n" ${SOURCEDOC}
    exit 1
fi

# Set default source
printf -- "Source document: %s\n" ${SOURCEDOC}

# Compile output document name
VERSION=$(git describe --abbrev=0 --tags)
PUBDIR=${SRCDIR}"/docs"
PUBFILE=${SRCFILE%.*}"-"${VERSION}"."${FORMAT}
OUTPUTDOC=${PUBDIR}"/"${PUBFILE}
printf -- "Output document: %s\n" ${OUTPUTDOC}

# Final check
printf -- "Continue? (y/n) " ${OUTPUTDOC}
read yn 2> /dev/null
case "$yn" in
    y|Y) true;;
    *)
        printf "Exiting.\n"
        exit 2;;
esac

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
