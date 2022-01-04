;;; -*- lexical-binding: t -*-

(require 'cl-lib)
(require 'org)
(require 'el-mock)

(when (require 'undercover nil t)
  (undercover "*.el"))
(require 'company-tailwindcss (expand-file-name "company-tailwindcss.el"))

(provide 'company-tailwindcss-test)
