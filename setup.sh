#!/bin/bash

# TODO: Should compute this dynamically.
#
#       However, when sourced from ~/.bash_profile,
#       $0 = -bash
#
declare -r SRCDIR="${HOME}/Development/etc"

# ------------------------------------------------------------------------------
# Bash
source "${SRCDIR}/bash/term/term-doubleotoo"

