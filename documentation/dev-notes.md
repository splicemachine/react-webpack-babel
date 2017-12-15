# Development Notes

## nginx Tidbits
This block works:
```
location / {
    try_files $uri $uri/ /index.html;
}
```
This block will fail when you reload a URI route.
```
location / {
    try_files $uri $uri/ index.html;
}
```
I think this has to do with the fact that `index.html` won't be found at `sample/index.html`, but this is a hunch.