Desktop for container
=====

### Build XFCE Base
```
docker build --rm -t izone/desktop:xfce-base -f Dockerfile.xfce .

# Apptainer
apptainer pull ./desktop-xfce.sif docker://izone/desktop:xfce-base
```

### Build LXDE Base
```
docker build --rm -t izone/desktop:lxde-base -f Dockerfile.lxde .

# Apptainer
apptainer pull ./desktop-lxde.sif docker://izone/desktop:lxde-base
```

### Run
```
apptainer run --writable-tmpfs --cleanenv docker-daemon:izone/desktop:xfce-base
```
