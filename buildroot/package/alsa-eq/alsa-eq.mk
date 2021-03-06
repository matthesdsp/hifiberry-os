#############################################################
#
# alsa-eq
#
#############################################################

ALSA_EQ_VERSION = 23f7609d63faf4f502d5fc441affba254c9bdabd
ALSA_EQ_SITE = $(call github,hifiberry,alsaequal,$(ALSA_EQ_VERSION))

ALSA_EQ_DEPENDENCIES = caps alsa-lib

define ALSA_EQ_BUILD_CMDS
	cd $(@D) && CC=$(TARGET_CC) LD=$(TARGET_CC) make
	echo "alsaeq make done"
	sleep 1
endef

define ALSA_EQ_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/usr/lib/alsa-lib
	$(INSTALL) -D -m 755 $(@D)/libasound_module_ctl_equal.so \
           $(TARGET_DIR)/usr/lib/alsa-lib/
	$(INSTALL) -D -m 755 $(@D)/libasound_module_pcm_equal.so \
           $(TARGET_DIR)/usr/lib/alsa-lib/
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/alsa-eq/asound.conf.eq \
           $(TARGET_DIR)/etc/asound.conf.eq
endef

$(eval $(generic-package))
