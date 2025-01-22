# Baka to Test to Shoukanjuu Portable Rebuild
An attempt to create an english patch for NPJH-50680 (バカとテストと召喚獣 Portable). 
This is a continuation of the parent github repo continuing their work
Join us on [Discord](https://discord.gg/7epHFB43nw)

Its been more than 10 years alraedy, I'am looking to have it at least in a working state.

Thanks to @ethanol and @FistingUranus from LifeBottle [Github](https://github.com/lifebottle/)
[WebPage](https://www.lifebottle.org/#/) for their work and continous support!!! <3 

If you want to contribute on this project for exposure or bragging rights send a message
to the aforementioned discord or look for @NadiaFlowers or @Ascrein_Hazard on it.
Some guides or more info on the project can be found on documentation channel (WIP)

this is a fan project, we run on love, coffee and depression

## Info on Parent Github page:
 
### Repo Structure
`0_orginal` = The base game files  
`1_extracted` = The extracted workable file from orginal folder  
`2_translated` = The modified file, googlesheet curl destination directory  
`3_patched` = reinserted files ready to be put inside the iso  

### File Structure
```
D:.
|   UMD_DATA.BIN
|
\---PSP_GAME
    |   ICON0.PNG
    |   PARAM.SFO
    |   PIC1.PNG
    |
    +---INSDIR
    |       0000.DNS
    |       ICON0.PNG
    |       PIC1.PNG
    |
    +---SYSDIR
    |   |   BOOT.BIN
    |   |   EBOOT.BIN
    |   |   OPNSSMP.BIN
    |   |
    |   \---UPDATE
    |           DATA.BIN
    |           EBOOT.BIN
    |           PARAM.SFO
    |
    \---USRDIR
        \---DATA
                ed.pmf
                ICON0.PNG
                lt.bin
                MOV_PR.pmf
                op.pmf
                PIC1.PNG
                pr.bin
                sc.cpk
                se.acx
                union.cpk
                vo.cpk
```

### Programmer Notes

| PSP_GAME\USRDIR\DATA | Notes |
| -------------------- | ----- |
| ed.pmf | Ending movie |
| ICON0.PNG | Save image |
| lt.bin | Font |
| MOV_PR.pmf | Disclaimer? |
| op.pmf | Opening movie |
| PIC1.PNG | Game Image |
| pr.bin | ? |
| sc.cpk | Script |
| se.acx | Sound effects? |
| union.cpk | Music & Textures |
| vo.cpk | Voices |

### Resources
| Tool | Notes |
| ---- | ----- |
| [Kuriimu2](https://github.com/FanTranslatorsInternational/Kuriimu2) | Unpack / Repack CPK files |

![](docs/screenshots/kuriimu2.png)
