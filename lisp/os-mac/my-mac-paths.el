;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Classpaths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq swank-clojure-extra-classpaths
(list "/Users/mikesmi/clojure/clojure-contrib/clojure-contrib.jar"
      "/Users/mikesmi/.emacs.d/plugins/hsqldb/src"
      "/Users/mikesmi/.emacs.d/plugins/hsqldb/lib/hsqldb.jar"
      "/Users/mikesmi/.emacs.d/plugins/yasnippet-0.6.1c"
      "/Users/mikesmi/clojure/compojure/src"
      "/Users/mikesmi/clojure/compojure/deps/commons-codec-1.3.jar"
      "/Users/mikesmi/clojure/compojure/deps/commons-fileupload-1.2.1.jar"
      "/Users/mikesmi/clojure/compojure/deps/commons-io-1.4.jar"
      "/Users/mikesmi/clojure/compojure/deps/grizzly-http-servlet-1.9.10.jar"
      "/Users/mikesmi/clojure/compojure/deps/grizzly-http-webserver-1.9.10.jar"
      "/Users/mikesmi/clojure/compojure/deps/jetty-6.1.15.jar"
      "/Users/mikesmi/clojure/compojure/deps/jetty-util-6.1.15.jar"
      "/Users/mikesmi/clojure/compojure/deps/servlet-api-2.5-20081211.jar"
      "/Users/mikesmi/clojure-files"
      "/Users/mikesmi/Projects"
      "/Users/mikesmi/jruby-1.4.0/bin")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Load paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "/Users/mikesmi/clojure/clojure-mode")
(add-to-list 'load-path "/Users/mikesmi/clojure/swank-clojure")
(add-to-list 'load-path "/Users/mikesmi/clojure/slime")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Swank paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(swank-clojure-config
(setq swank-clojure-jar-path "/Users/mikesmi/clojure/clojure/clojure.jar"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Environment paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; show env var named path
(getenv "PATH")

; example of setting env var named ¡°path¡±
; by appending a new path to existing path
(setenv "PATH"
  (concat
   "/Users/mikesmi/jruby-1.4.0/bin" ":"
   "/Users/mikesmi/ioke/bin" ":"
   (getenv "PATH")
  )
)

(setenv "GEM_HOME" "/Users/mikesmi/jruby-1.4.0/lib/ruby/gems/1.8")