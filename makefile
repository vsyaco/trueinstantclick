all:
	@head -1 trueinstantclick.js > min.head.js
	@curl --silent --data "output_info=compiled_code" --data-urlencode "js_code@trueinstantclick.js" "http://closure-compiler.appspot.com/compile" -o min.code.js
	@cat min.head.js min.code.js > trueinstantclick.min.js
	@rm min.head.js min.code.js
	@gzip trueinstantclick.min.js
	@du -b trueinstantclick.js trueinstantclick.min.js.gz
	@gunzip trueinstantclick.min.js.gz

clean:
	@rm instantclick.min.js
