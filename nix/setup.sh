unset PATH
for p in $baseInputs $buildInputs; do
  export PATH=$p/bin${PATH:+:}$PATH
done

function buildPhase() {
    cp -r $test_target test
    chmod -R u+w test 
    ${emacs}/bin/emacs -q --version
    yes yes | ${emacs}/bin/emacs -q -batch -l $company_tailwindcss -l ert-runner | tee $out
    STATUS="${PIPESTATUS[1]}"
    if [ $STATUS -gt 0 ]
    then
        rm $out
        exit $STATUS
    fi
}

function genericBuild() {
  buildPhase
}
