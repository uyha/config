# Defined in - @ line 1
function man --wraps=man\ -H\"firefox\ -P\ \'default\'\" --description alias\ man=man\ -H\"firefox\ -P\ \'default\'\"
 command man -H"firefox -P 'default'" $argv;
end
