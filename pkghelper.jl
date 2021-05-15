import Pkg

#using Pkg
using Base
using DocOpt
using Gtk
using Gtk.ShortNames

mutable struct JuliaHelper
    registries::Vector{Pkg.RegistrySpec}
    server::String
    depots::Vector{String}
    dependencies::Dict{Base.UUID,Pkg.Types.PackageInfo}
    main_depot::String
end

function JuliaHelper_init()
    # self = JuliaHelper()
    # self.server = Pkg.pkg_server()
    # self.depots = Pkg.depots()
    # self.main_depots = Pkg.depots1()
    # #jh.registries = listRegistries()
    # self.dependencies = Pkg.dependencies()
    regspecs = []
    return JuliaHelper(
        regspecs,
        Pkg.pkg_server(),
        Pkg.depots(),
        Pkg.dependencies(),
        Pkg.depots1(),
    )

end

function ensureUpToDate(self::JuliaHelper)
    #Pkg.API.up()
    Pkg.update()
end

function listRegistries(self::JuliaHelper)
    #     return Registry.status()
end
#

function displayInfo(self::JuliaHelper)
    println("server : ", self.server)
    println("registries: ")
    let deps = jh.dependencies
        for (uuid, pkginfo) in deps
            #            println(typeof(uuid))
            pkgdeps = pkginfo.dependencies
            println(
                uuid,
                pkginfo.name,
                "|",
                pkginfo.version,
                "|",
                pkginfo.is_direct_dep,
                "|",
                pkginfo.is_pinned,
                "|",
                pkginfo.is_tracking_path,
                "|",
                pkginfo.git_revision,
                "|",
                pkginfo.git_source,
                "|",
                pkginfo.source,
            )
            #pkgdeps)
            #println(uuid.name)
        end
    end
end

# PackageSpec("Gtk") # => returns a PackageSpec record

jh = JuliaHelper_init()
displayInfo(jh)
