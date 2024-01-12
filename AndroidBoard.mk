#
# Copyright (C) 2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

INSTALLED_KERNEL_TARGET := $(PRODUCT_OUT)/kernel
recovery_uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk-recovery.cpio

RECOVERY_FIRMWARE_TARGETS := \
    s3908_a73xq_boe.bin \
    s3908_a73xq_csot.bin \
    s3908_a73xq_sdc_4th.bin \
    s3908_a73xq_sdc.bin

INSTALLED_RECOVERY_FIRMWARE_TARGETS := $(RECOVERY_FIRMWARE_TARGETS:%=$(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware/tsp_synaptics/%)
$(INSTALLED_RECOVERY_FIRMWARE_TARGETS): $(INSTALLED_KERNEL_TARGET)
	echo -e ${CL_GRN}"Copying touchscreen firmware to recovery"${CL_RST}
	@mkdir -p $(dir $@)
	cp $(@F:%=$(TARGET_OUT_VENDOR)/firmware/tsp_synaptics/%) $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware/tsp_synaptics/

$(recovery_uncompressed_ramdisk): $(INSTALLED_RECOVERY_FIRMWARE_TARGETS)
