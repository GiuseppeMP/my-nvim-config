local M = {}

M.ignore_ssl =
"-Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true"

M.skip_tests = "-DskipTests"

M.java_icon = ''


return M
