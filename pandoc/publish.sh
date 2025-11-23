#!/bin/bash
#
# Script for publishing the Whiteflag specification in various
# document formats from its markdown source file in the root
# of the repository to the `docs/` directory.
#
# Using pandoc v
#
# Usage: publish [ pdf | html | md ] [<sourcefile>]
#

# Check pandoc
if [[ ! -x $(which pandoc) ]]; then
    printf -- "Cannot find pandoc; please check if pandoc is installed.\n"
    exit 1
fi

# Check first argument: output format
ALLFORMATS="html pdf md"
if [[ -n "${1}" ]]; then
    formatList="${1}"
else
    formatList=${ALLFORMATS}
fi

# Check second argument: source file
srcDoc="./wf-specification.md"
if [[ -n "${2}" ]]; then
    srcDoc="${2}"
fi
if [[ ${srcDoc##*.} != "md" ]]; then
    printf -- "Source document %s does not have a markdown extension.\n" ${srcDoc}
    exit 1
fi
if [[ -e ${srcDoc} ]]; then
    srcDir=$(dirname ${srcDoc})
    srcFileName=$(basename ${srcDoc})
else
    printf -- "Source document %s does not exist.\n" ${srcDoc}
    exit 1
fi
printf -- "Source document: %s\n" ${srcDoc}

# Directories and filenames
gitVersion=$(git describe --abbrev=0 --tags)
pandocDir="${srcDir}/pandoc"
outDir="${srcDir}/docs/${gitVersion%%-*}"
outFileName="${srcFileName%.*}-${gitVersion}"
outFileBase="${outDir}/${outFileName}"
printf -- "Tagged version: %s\n" ${gitVersion}
printf -- "Output directory: %s\n" ${outDir}

# Final check
if [[ "${formatList}" == "${ALLFORMATS}" ]]; then
    printf -- "Publishing multiple documents: %s\n" "${outFileBase}.*"
    printf -- "Continue? (y/n) "
    read yn 2> /dev/null
    case "$yn" in
        y|Y) true;;
        *)
            printf "Aborting.\n"
            exit 2;;
    esac
fi

# Run pandoc
exitCodeAll=0
for format in ${formatList}; do
    outDoc="${outFileBase}.${format}"
    templateFile="${pandocDir}/${format}.template"
    headerFile="${pandocDir}/${format}.yaml"
    errorFile="/tmp/${0##*/}-${format}.err"
    case "${format}" in
        pdf)
            pandoc  -s --pdf-engine=lualatex \
                    --template ${templateFile} \
                    -o ${outDoc} ${headerFile} ${srcDoc} \
                    2> ${errorFile}
            exitCode=${?}
            ;;
        html)
            pandoc  -s \
                    --template ${templateFile} \
                    -o ${outDoc} ${headerFile} ${srcDoc} \
                    2> ${errorFile}
            exitCode=${?}
            ;;
        md)
            outDoc="${outDir}/index.${format}"
            cp ${srcDoc} ${outDoc} 2> ${errorFile}
            exitCode=${?}
            ;;
        *)
            printf -- "Format %s is not supported.\n" ${format}
            printf -- "Usage: %s [ pdf | html | md ] [<sourcefile>]\n" ${0##*/}
            exit 1
            ;;
    esac
    if [[ ${exitCode} == 0 ]]; then
        printf -- "Succesfully created %s\n" ${outDoc}
    else
        printf -- "Error creating %s\n" ${outDoc}
        cat ${errorFile} | awk '{ print "  "$0 }'
        rm ${errorFile}
        exitCodeAll=$((exitCodeAll + exitCode))
    fi
done
printf -- "ALl done.\n"
exit ${exitCodeAll}
