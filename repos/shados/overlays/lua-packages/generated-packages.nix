
/* pkgs/development/lua-modules/generated-packages.nix is an auto-generated file -- DO NOT EDIT!
Regenerate it with:
nixpkgs$ ./maintainers/scripts/update-luarocks-packages

You can customize the generated packages in pkgs/development/lua-modules/overrides.nix
*/

{ self, stdenv, lib, fetchurl, fetchgit, ... } @ args:
self: super:
with self;
{
cmark = buildLuarocksPackage {
  pname = "cmark";
  version = "0.29.0-1";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/cmark-0.29.0-1.rockspec";
    sha256 = "0mrab0rzsykalxhifg96a8zr31m47qxpx5vfd42zlfcmz56gxc2s";
  }).outPath;
  src = fetchgit ( removeAttrs (builtins.fromJSON ''{
  "url": "https://github.com/jgm/cmark-lua",
  "rev": "4931e04b139cd41b92571b703c3dc350f005c9bd",
  "date": "2019-04-08T10:52:43-07:00",
  "path": "/nix/store/0h21s6s40ywkn9866wqhr83fr4d57df2-cmark-lua",
  "sha256": "10c4ra388mr5knfw41lmx57mkrmfa5n4kh22iyfml389zv1cwd86",
  "fetchLFS": false,
  "fetchSubmodules": true,
  "deepClone": false,
  "leaveDotGit": false
}
 '') ["date" "path"]) ;


  meta = {
    homepage = "https://github.com/jgm/cmark-lua";
    description = "Lua wrapper for libcmark, CommonMark Markdown parsing\
      and rendering library";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "BSD2";
  };
};

copas = buildLuarocksPackage {
  pname = "copas";
  version = "2.0.2-1";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/copas-2.0.2-1.rockspec";
    sha256 = "1x9lcr7hvbr0hbq6cxdkk4j2ixg2b9n0z2d0idrxcn7qnhrywp57";
  }).outPath;
  src = fetchurl {
    url    = "https://github.com/keplerproject/copas/archive/v2_0_2.tar.gz";
    sha256 = "069waz10ygs89mqgzlnk5fkalxl264xb83bi7hanyna6phivgis5";
  };

  disabled = (luaOlder "5.1") || (luaAtLeast "5.4");
  propagatedBuildInputs = [ lua luasocket coxpcall ];

  meta = {
    homepage = "http://www.keplerproject.org/copas/";
    description = "Coroutine Oriented Portable Asynchronous Services";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT/X11";
  };
};

etlua = buildLuarocksPackage {
  pname = "etlua";
  version = "1.3.0-1";
  knownRockspec = (fetchurl {
    url    = "https://raw.githubusercontent.com/rocks-moonscript-org/moonrocks-mirror/master/etlua-1.3.0-1.rockspec";
    sha256 = "1g98ibp7n2p4js39din2balncjnxxdbaq6msw92z072s2cccx9cf";
  }).outPath;
  src = fetchgit ( removeAttrs (builtins.fromJSON ''{
  "url": "https://github.com/leafo/etlua.git",
  "rev": "8dda2e5aeb4413446172a562a9a374b700054836",
  "date": "2019-08-02T18:07:22-07:00",
  "path": "/nix/store/kk7sib6lwra0wyf6yjc8shkny7b5qnm7-etlua",
  "sha256": "0ns7vvzslxhx39xwhxzi6cwkk2vcxidxidgysr03sq47h8daspig",
  "fetchLFS": false,
  "fetchSubmodules": true,
  "deepClone": false,
  "leaveDotGit": false
}
 '') ["date" "path"]) ;

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ lua ];

  meta = {
    homepage = "https://github.com/leafo/etlua";
    description = "Embedded templates for Lua";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT";
  };
};

inotify = buildLuarocksPackage {
  pname = "inotify";
  version = "0.5-1";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/inotify-0.5-1.rockspec";
    sha256 = "0mwzzhhlwpk7gsbvv23ln486ay27z3l849nga2mh3vli6dc1l0m2";
  }).outPath;
  src = fetchurl {
    url    = "https://github.com/hoelzro/linotify/archive/0.5.tar.gz";
    sha256 = "0f73fh1gqjs6vvaii1r2y2266vbicyi18z9sj62plfa3c3qhbl11";
  };

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ lua ];

  meta = {
    homepage = "http://hoelz.ro/projects/linotify";
    description = "Inotify bindings for Lua";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT";
  };
};

lcmark = buildLuarocksPackage {
  pname = "lcmark";
  version = "0.29.0-5";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/lcmark-0.29.0-5.rockspec";
    sha256 = "0n9p18z9vrsdsvarfqkbfz3whswpxjghm2y5889ri4dvg67sk7ys";
  }).outPath;
  src = fetchgit ( removeAttrs (builtins.fromJSON ''{
  "url": "https://github.com/jgm/lcmark",
  "rev": "320a347e229c91215a0488502a1fcca96f25939c",
  "date": "2020-03-17T16:49:54-07:00",
  "path": "/nix/store/4ckqbzvnkzqa8nwarb0lk9v1yz3jhq27-lcmark",
  "sha256": "1vq2xa0385f375inlnlvvhmsxigdpf55j3aa41w23zbz4z9x52gb",
  "fetchLFS": false,
  "fetchSubmodules": true,
  "deepClone": false,
  "leaveDotGit": false
}
 '') ["date" "path"]) ;

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ lua cmark yaml lpeg optparse ];

  meta = {
    homepage = "https://github.com/jgm/lcmark";
    description = "A command-line CommonMark converter with flexible\
      features, and a lua module that exposes these features.";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "BSD2";
  };
};

loadkit = buildLuarocksPackage {
  pname = "loadkit";
  version = "1.1.0-1";
  knownRockspec = (fetchurl {
    url    = "https://raw.githubusercontent.com/rocks-moonscript-org/moonrocks-mirror/master/loadkit-1.1.0-1.rockspec";
    sha256 = "08fx0xh90r2zvjlfjkyrnw2p95xk1a0qgvlnq4siwdb2mm6fq12l";
  }).outPath;
  src = fetchgit ( removeAttrs (builtins.fromJSON ''{
  "url": "https://github.com/leafo/loadkit.git",
  "rev": "c6c712dab45f6c568821f9ed7b49c790a44d12e7",
  "date": "2021-01-07T14:41:10-08:00",
  "path": "/nix/store/xvwq7b2za8ciww1gjw7vnspg9183xmfa-loadkit",
  "sha256": "15znriijs7izf9f6vmhr6dnvw3pzr0yr0mh6ah41fmdwjqi7jzcz",
  "fetchLFS": false,
  "fetchSubmodules": true,
  "deepClone": false,
  "leaveDotGit": false
}
 '') ["date" "path"]) ;

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ lua ];

  meta = {
    homepage = "https://github.com/leafo/loadkit";
    description = "Loadkit allows you to load arbitrary files within the Lua package path";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT";
  };
};

lua-ev = buildLuarocksPackage {
  pname = "lua-ev";
  version = "v1.5-1";
  knownRockspec = (fetchurl {
    url    = "https://raw.githubusercontent.com/rocks-moonscript-org/moonrocks-mirror/master/lua-ev-v1.5-1.rockspec";
    sha256 = "0yi9gfran0d0qvjaypf066ihmz3wksw1s9q99hpaw798gnpg60rr";
  }).outPath;
  src = fetchgit ( removeAttrs (builtins.fromJSON ''{
  "url": "https://github.com/brimworks/lua-ev",
  "rev": "0e7b95f0f22a6584f61ae6e1a9d5f0075f33ed11",
  "date": "2019-09-30T07:09:48-07:00",
  "path": "/nix/store/98678lk8w3gssa878bbb9wfi49qx4l8s-lua-ev",
  "sha256": "0hnda3716x3xpkiwkv023kadb59c0gix26dsvaad1jb0bisyrfyb",
  "fetchLFS": false,
  "fetchSubmodules": true,
  "deepClone": false,
  "leaveDotGit": false
}
 '') ["date" "path"]) ;

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ lua ];

  meta = {
    homepage = "http://github.com/brimworks/lua-ev";
    description = "Lua integration with libev";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT/X11";
  };
};

lua-testmore = buildLuarocksPackage {
  pname = "lua-testmore";
  version = "0.3.6-1";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/lua-testmore-0.3.6-1.rockspec";
    sha256 = "0x4f6yrjf8pal8z4338bsw776c0h3m7jnqk40kmfhlnynpwxdk10";
  }).outPath;
  src = fetchurl {
    url    = "https://framagit.org/fperrad/lua-TestMore/raw/releases/lua-testmore-0.3.6.tar.gz";
    sha256 = "0z5xh0xd589jcbc9xsmzhkfwpmcsl1a6p6rrn831k4ibya9cqc3y";
  };

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ lua ];

  meta = {
    homepage = "https://fperrad.frama.io/lua-TestMore/";
    description = "an Unit Testing Framework";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT/X11";
  };
};

lub = buildLuarocksPackage {
  pname = "lub";
  version = "1.1.0-1";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/lub-1.1.0-1.rockspec";
    sha256 = "1gkb79jsxx3kxd7n2gkvycfmysg3zxb1qyjhwzfdqn9yq2s39rp8";
  }).outPath;
  src = fetchgit ( removeAttrs (builtins.fromJSON ''{
  "url": "https://github.com/lubyk/lub",
  "rev": "10542b0e3336edc374a3e048b666c2cdc0e9ce70",
  "date": "2015-05-11T11:33:52+02:00",
  "path": "/nix/store/srz37g6b28hpskfdhr830qk1lnczayh7-lub",
  "sha256": "1w0cppxa0p47ww4q2y1748z0h3ix5cnkwwj1bjbjym3ky52caac6",
  "fetchLFS": false,
  "fetchSubmodules": true,
  "deepClone": false,
  "leaveDotGit": false
}
 '') ["date" "path"]) ;

  disabled = (luaOlder "5.1") || (luaAtLeast "5.4");
  propagatedBuildInputs = [ lua luafilesystem ];

  meta = {
    homepage = "http://doc.lubyk.org/lub.html";
    description = "Lubyk base module.";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT";
  };
};

lunix = buildLuarocksPackage {
  pname = "lunix";
  version = "20170920-1";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/lunix-20170920-1.rockspec";
    sha256 = "0w2ranavaf62nn2afba6n6wnwyjjypmsdwhs73bxs82v4hvlq9dv";
  }).outPath;
  src = fetchurl {
    url    = "https://github.com/wahern/lunix/archive/rel-20170920.tar.gz";
    sha256 = "11acqirzqc51lb27frp367k0q2rkbpwfkywc2b4xyhj9a4wdaz3s";
  };


  meta = {
    homepage = "http://25thandclement.com/~william/projects/lunix.html";
    description = "Lua Unix Module.";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT/X11";
  };
};

mobdebug = buildLuarocksPackage {
  pname = "mobdebug";
  version = "0.80-1";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/mobdebug-0.80-1.rockspec";
    sha256 = "1y9id20v02fa26f6nl4fym8cy0fwj72y48pry4j5m6q3fjr6f6qp";
  }).outPath;
  src = fetchgit ( removeAttrs (builtins.fromJSON ''{
  "url": "https://github.com/pkulchenko/MobDebug.git",
  "rev": "e13cd45b4f176d5a496b3cfbd1efbc3b56e3f270",
  "date": "2021-06-16T22:40:26-07:00",
  "path": "/nix/store/l9slh7pnaan1brqischxkishbpw22j20-MobDebug",
  "sha256": "1ff2312w84700vb1k0w35bgphnglx7mk4z3wa0857dxrf86shwv7",
  "fetchLFS": false,
  "fetchSubmodules": true,
  "deepClone": false,
  "leaveDotGit": false
}
 '') ["date" "path"]) ;

  disabled = (luaOlder "5.1") || (luaAtLeast "5.5");
  propagatedBuildInputs = [ lua luasocket ];

  meta = {
    homepage = "https://github.com/pkulchenko/MobDebug";
    description = "MobDebug is a remote debugger for the Lua programming language";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT/X11";
  };
};

moonpick = buildLuarocksPackage {
  pname = "moonpick";
  version = "0.8-1";
  knownRockspec = (fetchurl {
    url    = "https://raw.githubusercontent.com/rocks-moonscript-org/moonrocks-mirror/master/moonpick-0.8-1.rockspec";
    sha256 = "1y3xgp9alvc4rhcf871dk4877x0nxr3m7g6344dxr004j34gi0kf";
  }).outPath;
  src = fetchgit ( removeAttrs (builtins.fromJSON ''{
  "url": "https://github.com/nilnor/moonpick.git",
  "rev": "76ea5182e797addbd499ade4d96a9891c0e49d4c",
  "date": "2017-11-17T11:42:52+01:00",
  "path": "/nix/store/qdzaqjd5cy5d4xh006sfx2niwx0p3z44-moonpick",
  "sha256": "11narvcx5zn5nvy73pmp3kna8axndlzzfgw9jcv4mjnwxwb40ws7",
  "fetchLFS": false,
  "fetchSubmodules": true,
  "deepClone": false,
  "leaveDotGit": false
}
 '') ["date" "path"]) ;

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ lua moonscript ];

  meta = {
    homepage = "https://github.com/nilnor/moonpick";
    description = "An alternative moonscript linter.";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT";
  };
};

moonscript = buildLuarocksPackage {
  pname = "moonscript";
  version = "0.5.0-1";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/moonscript-0.5.0-1.rockspec";
    sha256 = "06ykvmzndkcmbwn85a4l1cl8v8jw38g0isdyhwwbgv0m5a306j6d";
  }).outPath;
  src = fetchgit ( removeAttrs (builtins.fromJSON ''{
  "url": "https://github.com/leafo/moonscript.git",
  "rev": "b7efcd131046ed921ae1075d7c0f6a3b64a570f7",
  "date": "2021-03-18T11:51:52-07:00",
  "path": "/nix/store/xijbk0bgjpxjgmvscbqnghj4r3zdzgxl-moonscript",
  "sha256": "14xx6pij0djblfv3g2hi0xlljh7h0yrbb03f4x90q5j66v693gx7",
  "fetchLFS": false,
  "fetchSubmodules": true,
  "deepClone": false,
  "leaveDotGit": false
}
 '') ["date" "path"]) ;

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ lua lpeg alt-getopt luafilesystem ];

  meta = {
    homepage = "http://moonscript.org";
    description = "A programmer friendly language that compiles to Lua";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT";
  };
};

moor = buildLuarocksPackage {
  pname = "moor";
  version = "v5.0-1";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/moor-v5.0-1.rockspec";
    sha256 = "0hmmqz0p56m6aaqkck0g5cfnfmyqlmf3kwj46p8m0kxlnm2davhv";
  }).outPath;
  src = fetchgit ( removeAttrs (builtins.fromJSON ''{
  "url": "https://github.com/nymphium/moor",
  "rev": "6f636cee90fdf5a43c9ed89a6a2f3653a12c909e",
  "date": "2017-01-31T18:47:43+09:00",
  "path": "/nix/store/5yj19riv6mrvfnz7mnqzn279y61kkpr4-moor",
  "sha256": "0m4yynl07l4r0d27a1d7689f4bwi6a794xz87mijqnpf4irk9rvj",
  "fetchLFS": false,
  "fetchSubmodules": true,
  "deepClone": false,
  "leaveDotGit": false
}
 '') ["date" "path"]) ;

  propagatedBuildInputs = [ moonscript inspect linenoise ];

  meta = {
    homepage = "https://github.com/Nymphium/moor";
    description = "MoonScript REPL";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT";
  };
};

optparse = buildLuarocksPackage {
  pname = "optparse";
  version = "1.4-1";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/optparse-1.4-1.rockspec";
    sha256 = "0fb3h0f62yqwiq6zf0q7j82617aap0rcr01dw84cinyb5c0q1y0j";
  }).outPath;
  src = fetchurl {
    url    = "http://github.com/gvvaughan/optparse/archive/v1.4.zip";
    sha256 = "09cc1xgm7kpyiqv4r0mgg13afdqrhrins558iq53d4rl533z52li";
  };

  disabled = (luaOlder "5.1") || (luaAtLeast "5.5");
  propagatedBuildInputs = [ lua ];

  meta = {
    homepage = "http://gvvaughan.github.io/optparse";
    description = "Parse and process command-line options";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT/X11";
  };
};

pegdebug = buildLuarocksPackage {
  pname = "pegdebug";
  version = "0.41-1";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/pegdebug-0.41-1.rockspec";
    sha256 = "0jj4jal0bdbs2zmfzbbzxfmcb8bhqv5dnfai824m16h8sdh6cms2";
  }).outPath;
  src = fetchgit ( removeAttrs (builtins.fromJSON ''{
  "url": "https://github.com/pkulchenko/PegDebug.git",
  "rev": "4f72126520da725687cde0aaecdd5b1f7b3701d5",
  "date": "2019-09-19T09:25:45-07:00",
  "path": "/nix/store/kjwdszj21xwl97wcc7rm5g0x8m4v1hax-PegDebug",
  "sha256": "1gm4l71l9rcg71gz8k8i52lvn6qnhbvhb798g5v1kb8k99a3lz0a",
  "fetchLFS": false,
  "fetchSubmodules": true,
  "deepClone": false,
  "leaveDotGit": false
}
 '') ["date" "path"]) ;

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ lua lpeg ];

  meta = {
    homepage = "http://github.com/pkulchenko/PegDebug";
    description = "PegDebug is a trace debugger for LPeg rules and captures.";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT/X11";
  };
};

spawn = buildLuarocksPackage {
  pname = "spawn";
  version = "0.1-0";
  knownRockspec = (fetchurl {
    url    = "https://luarocks.org/spawn-0.1-0.rockspec";
    sha256 = "0yic1caj2fn0g4klnks8qkyqbvjiycdisgni98k2p3zlnb0r58v6";
  }).outPath;
  src = fetchurl {
    url    = "https://github.com/daurnimator/lua-spawn/archive/v0.1.zip";
    sha256 = "16av0k3wfsn65isf15z1f2s6ayxjmihy3mplwj3w5vghbgrxq09m";
  };

  disabled = (luaOlder "5.1") || (luaAtLeast "5.4");
  propagatedBuildInputs = [ lua lunix ];

  meta = {
    homepage = "https://github.com/daurnimator/lua-spawn";
    description = "A lua library to spawn programs";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT";
  };
};

yaml = buildLuarocksPackage {
  pname = "yaml";
  version = "1.1.2-1";
  knownRockspec = (fetchurl {
    url    = "mirror://luarocks/yaml-1.1.2-1.rockspec";
    sha256 = "0s5q69a7qwif5n3lv5fp93c4c17vxb7qf6nqny76gsa8ihpl7z8x";
  }).outPath;
  src = fetchgit ( removeAttrs (builtins.fromJSON ''{
  "url": "https://github.com/lubyk/yaml",
  "rev": "2031ddd0e442e5a9a409e97c4c5f3219d1839fb7",
  "date": "2015-05-11T12:35:47+02:00",
  "path": "/nix/store/5r2kmp3rwx321f1apha3ljdwgvab1xcv-yaml",
  "sha256": "0n688rr5lf9w87vkln6kf7s0qxw58n80dkpc3wkzcnqzy106g8nh",
  "fetchLFS": false,
  "fetchSubmodules": true,
  "deepClone": false,
  "leaveDotGit": false
}
 '') ["date" "path"]) ;

  disabled = (luaOlder "5.1") || (luaAtLeast "5.4");
  propagatedBuildInputs = [ lua lub ];

  meta = {
    homepage = "http://doc.lubyk.org/yaml.html";
    description = "Very fast yaml parser based on libYAML by Kirill Simonov";
    maintainers = with lib.maintainers; [ arobyn ];
    license.fullName = "MIT";
  };
};


}
/* GENERATED - do not edit this file */
