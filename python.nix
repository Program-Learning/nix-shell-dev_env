# shell.nix
{ pkgs ? import <nixpkgs> {} }:
let
  my-python-packages = ps: with ps; [
    pandas
    requests

    ipykernel jupyterlab 
    matplotlib numpy seaborn
    networkx
    beautifulsoup4
    selenium
    urllib3
    pyclip
    pybluez
    pymysql
    jieba
    wordcloud
    pandas_datareader

    ipython
    pandas
    requests
    pyquery
    pyyaml

    # other python packages
  ];
  my-python = pkgs.python3.withPackages my-python-packages;
in my-python.env

# However, if you already have a shell.nix with other packages, you can add python like this:

# ...
# pkgs.mkShell {
#   packages = [
#     # ...
#     (python3.withPackages my-pythonPackages) # we have defined this in the installation section
#   ];
# }

