This Hugo module provides custom emoji using shortcode 

From this: 
```markdown
I'm laughing {{< emoji "haha" >}}
{{< sticker "burn_joss_stick" >}}
```

To this:  
![Example](images/example.png) 

## Features 

- Allow you to use your own emoji packs
- Supports `.gif` images
- Automatically converts `.png`, `.jpg`, etc. to `webp`
- Images are lazy-loaded
- Final build contains only images that are being used

## Usage

Emoji is a little image with `display: inline-block`
```markdown
{{< emoji "file-name-without-extension" >}}
```

Sticker is a bigger image with `display: block` 
```markdown
{{< sticker "file-name-without-extension" >}}
```

## Installation

- You can use some online tool to convert `.yaml` to `.toml`
If you dont use `.yaml` to config your Hugo site

### 1. Prepare your hugo project 

You can skip this part if your project is already a `Hugo module`, have a
read at [official docs](https://gohugo.io/hugo-modules/use-modules/) if you
need further information.

tldr: simply run this command at project's root to initialize hugo module
```bash 
hugo mod init github.com/<your_user>/<your_project>
```

### 2. Install `hugo-vmoji` CLI:

```bash
go install github.com/remvn/hugo-vmoji@latest
```

### 3. Import `remvn/hugo-vmoji` module

You can import this module by adding the following to `hugo.yaml`
or `config/_default/config.yaml`

```yaml
module:
  imports:
    - path: github.com/remvn/hugo-vmoji
```

### 4. Add custom css 

Create a `css` file at `./assets/css/` directory

```css
/* ./assets/css/custom.css */
img.emoji {
    display: inline-block;
    vertical-align: text-bottom;
    height: 1.25em;
    width: auto;
    margin: 0;
}

img.sticker {
    display: block;
    height: 6rem;
    width: auto;
    margin: 0;
}
```

### 5. Create `assets/vmoji/` directory at your project's root

```bash
mkdir ./assets/vmoji
```
This directory is where you place all the images that will be used as emojis.
Supported types are `png`, `jpg`, `jpeg`, `gif` 

### 6. Generate `./data/vmoji.json`

Run this command at project's root
```bash
hugo-vmoji
```
This command will generate a `json` file at `./data/vmoji.json`
that holds emoji's names and path. Please run this command again 
if you added new images

### 7. Serve your site and use custom emoji

Your emojis should be ready to use, try adding a shortcode in your markdown
file 
```markdown
{{< emoji "filename-without-extension" >}}
```
and `hugo serve` to check the result.
