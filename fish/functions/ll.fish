function ll --wraps="lsd -l" --wraps="lsd -la" --wraps="lsd -lA" --description "alias ll=lsd -lA"
  lsd -lAv $argv

end
