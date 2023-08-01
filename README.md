# CV template using LaTex class for multiple languages support

I was looking all over the web for a suitable CV template and I was not successful. So I decided to create a new LaTex template (since it is always a better option than using Office :-)).

- Chronological CV
- Highly customizable
- Slick, but traditional design (well, by my taste at least)
- Optional fields 
- Support for multiple languages

## Getting Started
I am using MikTex and TeXstudio. The compilation is done with XeLaTex, since I wanted to change to custom fonts with package fontspec. Also, the font Lato is IMHAO really good choice:
http://www.latofonts.com/lato-free-fonts/

To install everything on Windows use Chocolatey:

```shell
choco install lato miktex texstudio
```

## Customization

Use the [example.tex](example.tex) as a starting point. There is the intended usage of the template class. You can check the result [example.pdf](example.pdf).

Add any language in [cvlanguages.tex](cvlanguages.tex). Just follow the comments.

The template can be changed by editing the file [cv.cls](cv.cls).

## Author

* **Jan Moravec**


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

