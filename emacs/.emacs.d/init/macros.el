 (defmacro with-library (symbol &rest body)
      `(when (require ,symbol nil t)
         ,@body))
