generate:
	@go run .

duplicate-shortcode:
	@cp ./layouts/shortcodes/emoji.html ./layouts/shortcodes/sticker.html
