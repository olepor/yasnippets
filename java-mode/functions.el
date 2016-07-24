
(defun javadoc-comment ()
  (interactive)
  (save-excursion
    (let* ((start-pos (re-search-forward "[[:space:]]\\w+?\\s-\\w+\\s(\\(.*\\)\\s)" nil t))
           (fill-string (match-string-no-properties 1)) ;; return the match group from the inner () match
           (snippet "/**\n")
           (m-start-pos 0)
           (cnt 0)
           )
      (message fill-string)
      (message (int-to-string m-start-pos))
      (while (string-match "\\w+\\[\*\]*\\s-\\(\\w+\\)" fill-string m-start-pos)
        (setq snippet (concat snippet "* @param " (substring fill-string (match-beginning 1) (match-end 1)) "\n"))
        (setq m-start-pos (match-end 1))
        )
      (setq snippet (concat snippet "* @return ${1:return value}\n" "*/"))
      snippet)))

(defun return-test ()
   "one")

(provide 'yasnippet-functions)
