import os
from setuptools import setup, find_packages
from gitissues.gitissues import GIT_ISSUES_VERSION

setup(
    #These need to be figured out
    author = "",
    author_email = "",
    url = "",
    #These don't
    license = "Other",
    name = 'git-issues',
    version = GIT_ISSUES_VERSION,
    description = "Distributed bug tracking for Git.",
    keywords = "bug, tracking, git, distributed",
    packages = find_packages(exclude=["t_*"]),
    classifiers = [
        "Topic :: Software Development :: Bug Tracking",
        "Development Status :: 4 - Beta",
        ],
    entry_points = {
        'console_scripts': ['git-issues = gitissues.gitissues:main']
        },
    data_files = [
        ('git-issues',['LICENSE','README'])
        ],
    )

