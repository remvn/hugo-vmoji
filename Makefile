generate:
	@go run ./cmd/vmoji-json

duplicate-shortcode:
	@cp ./layouts/shortcodes/emoji.html ./layouts/shortcodes/sticker.html
