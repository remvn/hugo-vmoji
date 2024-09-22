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

- This installation process requires your site being `Hugo Module`,
have a read here [Hugo Modules](https://gohugo.io/hugo-modules/use-modules/)

- You can use some online tool to convert `.yaml` to `.toml`
If you dont use `.yaml` to configure your Hugo site

### 1. Install `hugo-vmoji` CLI:

```bash
go install github.com/remvn/hugo-vmoji@latest
```

### 2. Import `remvn/hugo-vmoji` module

You can import this module by adding the following to `hugo.yaml`
or `config/_default/config.yaml`

```yaml
module:
  imports:
    - path: github.com/remvn/hugo-vmoji
      mounts:
        - source: layouts/shortcodes
          target: layouts/shortcodes
```

### 3. Add custom css 

Create a `css` file at `./static` directory

```css
/* ./static/custom.css */
img.emoji {
    display: inline-block;
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

### 3. Create `assets/vmoji/` directory at your project's root

```bash
mkdir ./assets/vmoji
```
This directory is where you place all the images that will be used as emojis.
Supported types are `png`, `jpg`, `jpeg`, `gif` 

### 4. Generate `./data/vmoji.json`

Run this command at project's root
```bash
hugo-vmoji
```
This command will generate a `json` file at `./data/vmoji.json`
that holds emoji's names and path. Please run this command again 
if you added new images
