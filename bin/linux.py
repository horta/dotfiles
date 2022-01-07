#!/usr/bin/env python3

from pathlib import Path
import questionary

image = questionary.select(
    "Image",
    choices=[
        'debian',
        'ubuntu',
    ], default='ubuntu').ask()

tag = ""
if image == "ubuntu":
    tag = questionary.select(
        "Tag",
        choices=[
            '16.04 LTS (Xenial)',
            '18.04 LTS (Bionic)',
            '18.10 (Cosmic)',
            '19.04 (Disco)',
            '19.10 (Eoan)',
            '20.04 LTS (Focal)',
            '20.10 (Groovy)',
            '21.04 (Hirsute)',
            '21.10 (Impish)',
            '22.04 LTS (Jammy)',
            'latest',
            'rolling',
        ], default='21.10 (Impish)').ask()
    tag = tag.split()[0]
elif image == "debian":
    tag = questionary.select(
        "Tag",
        choices=[
            'Stable',
            'Testing',
            'Unstable',
        ], default='Testing').ask()
    tag = tag.lower()

platform = questionary.select(
    "Platform",
    choices=[
        'linux/amd64',
        'linux/arm/v7',
        'linux/arm64/v8',
    ], default='linux/arm64/v8').ask()

mount_dir = questionary.text(
    "Mount directory", "").ask()

mount_arg = ""
if mount_dir != "":
    path = Path(mount_dir).resolve()
    mount_arg = f" -v {path.absolute()}:/{path.name} -w /{path.name}"


print(f"""
docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined\
{mount_arg}\
 --platform {platform} -it {image}:{tag} /bin/bash
""", end="")
