
# Variables
export PATH=$PATH:~/scripts
export HISTCONTROL=ignoreboth
export VISUAL=$(which nano)
export EDITOR=$(which nano)


# Aliases
alias la='ls -alh'
alias pdfy='libreoffice --headless --convert-to pdf'
alias repr='python -c "import sys;file=open(sys.argv[1]);print(repr(file.read()))"'

alias g=git
alias ca="git add .;git commit;"
alias gpom="git push origin master"

# Just fun
alias fucking=sudo
alias die='shutdown now'

#regex
alias reg_email='echo "[^[:space:]]+@[^[:space:]]+"'
alias reg_ip='echo "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"'

# Validate things
alias yamlcheck='python -c "import sys, yaml as y; y.safe_load(open(sys.argv[1]))"'

# Get to the top of a git tree
cdp () {

  TEMP_PWD=`pwd`
  while ! [ -d .git ]; do
  cd ..
  done
  OLDPWD=$TEMP_PWD

}

## cd ../../ becomes up 2
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}


#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

## Crappy archive tool with automated SHA256
archive(){
  filename="$1";
  if [[ $1 == "-v" ]]
  then
    filename="$2";
  else
    filename="$1";
  fi

  if [[ $filename == *".tar.bz2"* ]]
  then
    if [[ $1 == "-v" ]]
    then
      tar -cvjf $filename *;
    else
    tar -cjf $filename *;
    fi
  fi

  if [[ $filename == *".tar.gz"* ]]
  then
    if [[ $1 == "-v" ]]
    then
      tar -cvzf $filename *;
    else
    tar -czf $filename *;
    fi
  fi

  if [[ $filename == *".tar"* ]]
  then
    if [[ $1 == "-v" ]]
    then
      tar -cvf $filename *;
    else
    tar -cf $filename *;
    fi
  fi

  if [[ $filename == *".zip"* ]]
  then
    if [[ $1 == "-v" ]]
    then
      zip -r $filename *;
    else
      zip -rq $filename *;
    fi
  fi

  sha256sum $filename > $filename.sha256;
  sha256sum -c $filename.sha256;
}
