This is a minor release in response to an email from Kurt Hornik on 2023-08-19
regarding:

> Using @docType package no longer automatically adds a -package alias.
>  Instead document _PACKAGE to get all the defaults for package
>  documentation.

This has been fixed.

Also, the CITATION file has been updated to fix a NOTE about the old-style
personList() and citEntry().

## R CMD check results

0 errors | 0 warnings | 0 notes

R CMD check succeeded

## Test environments

* local macOS M2 install, R 4.3.1
* Windows (on github-actions), R 4.3.1
* Ubuntu 22.04.3 (on github-actions), R 4.3.1
* Ubuntu 22.04.3 (on github-actions), R-devel
* Windows (winbuilder), R-devel
