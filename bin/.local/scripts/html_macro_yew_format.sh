input=$(cat; echo x)
input=${input%x}
echo $input> /tmp/format_html_macro.html
cat /tmp/format_html_macro.html | prettier --stdin-filepath /tmp/format_html_macro.html
cat /tmp/format_html_macro.html
rm /tmp/format_html_macro.html
