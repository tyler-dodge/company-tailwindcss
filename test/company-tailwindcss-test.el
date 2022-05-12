;;; -*- lexical-binding: t -*-

(require 'cl-lib)
(require 'org)
(require 'el-mock)

(when (require 'undercover nil t)
  (undercover "*.el"))
(require 'company-tailwindcss (expand-file-name "company-tailwindcss.el"))

(ert-deftest company-tailwindcss-basic-complete ()
  (with-temp-buffer
    (cl-assert (should (equal
                        (length (company-tailwindcss--completions-for-prefix ""))
                        15914)))))
(ert-deftest company-tailwindcss-size-complete ()
  (with-temp-buffer
    (cl-assert
     (should
      (equal
       (company-tailwindcss--completions-for-prefix "columns-")
       '("columns-1"
         "columns-2"
         "columns-3"
         "columns-4"
         "columns-5"
         "columns-6"
         "columns-7"
         "columns-8"
         "columns-9"
         "columns-10"
         "columns-11"
         "columns-12"
         "columns-auto"
         "columns-3xs"
         "columns-2xs"
         "columns-xs"
         "columns-sm"
         "columns-md"
         "columns-lg"
         "columns-xl"
         "columns-2xl"
         "columns-3xl"
         "columns-4xl"
         "columns-5xl"
         "columns-6xl"
         "columns-7xl"))))))

(provide 'company-tailwindcss-test)
