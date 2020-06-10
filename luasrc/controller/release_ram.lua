module("luci.controller.release_ram",package.seeall)

function index()
    entry({"admin", "services", "release_ram"}, call("release_ram"), _("释放内存"), 9999).dependent = true
end
function release_ram()
    luci.sys.call("sync && echo 3 > /proc/sys/vm/drop_caches")
    luci.http.redirect(luci.dispatcher.build_url("admin/status"))
end
