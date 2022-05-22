[AlphaX](https://www.alphaxpr.com/)

[Pinout](https://rusefi.com/docs/pinouts/hellen/alphax-2chan/)

[iBom rev C](https://rusefi.com/docs/ibom/alphax_2ch-c-ibom.html)


[iBom rev B](https://rusefi.com/docs/ibom/alphax_2ch-b-ibom.html)

[Issue tracker & hardware files](https://github.com/rusefi/alphax-2chan)

Hello. [AlphaX 2Chan](https://rusefi.com/build_server/rusefi_bundle_alphax-2chan.zip)

On-board MPXH6400A

![x](Hardware/Hellen/alphax-2chan-rev-a.jpg)

[See also AlphaX-4chan](AlphaX-4chan)


## Q: how many injectors per channel?

A: VND14NV04TR-E 93mJ 18A. In terms of current and switching energy those could handle _many_ injectors per channel, maybe a dozen?


## Changelog

rev C:
 - pull-down fixed https://github.com/rusefi/alphax-2chan/issues/40
 - affected by BOM issue p-channel mosfet https://github.com/rusefi/alphax-2chan/issues/53

rev B:
 - affected by BOM issue p-channel mosfet https://github.com/rusefi/alphax-2chan/issues/53
* BT fixed
``
bluetooth_jdy 115200 alphax 1234
``

rev A:
 - affected by BOM issue p-channel mosfet https://github.com/rusefi/alphax-2chan/issues/53