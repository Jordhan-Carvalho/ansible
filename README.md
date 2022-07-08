Commands
Build the image for a ubuntu with user
```sh
docker build -t jordhanpc -f jordhan.Dockerfile .
```


run the image for a ubuntu with user using bash
```sh
docker run --rm -it jordhanpc bash
```

run ansible inside the docker with user
```sh
ansible-playbook ubuntu.yml --ask-vault-pass --ask-become-pass
```
