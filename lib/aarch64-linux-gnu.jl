using CEnum

"""
    aws_checksums_crc32(input, length, previousCrc32)

The entry point function to perform a CRC32 (Ethernet, gzip) computation. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc32 parameter as an initial value unless continuing to update a running crc in a subsequent call.

### Prototype
```c
uint32_t aws_checksums_crc32(const uint8_t *input, int length, uint32_t previousCrc32);
```
"""
function aws_checksums_crc32(input, length, previousCrc32)
    ccall((:aws_checksums_crc32, libaws_checksums), UInt32, (Ptr{UInt8}, Cint, UInt32), input, length, previousCrc32)
end

"""
    aws_checksums_crc32c(input, length, previousCrc32)

The entry point function to perform a Castagnoli CRC32c (iSCSI) computation. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc32 parameter as an initial value unless continuing to update a running crc in a subsequent call.

### Prototype
```c
uint32_t aws_checksums_crc32c(const uint8_t *input, int length, uint32_t previousCrc32);
```
"""
function aws_checksums_crc32c(input, length, previousCrc32)
    ccall((:aws_checksums_crc32c, libaws_checksums), UInt32, (Ptr{UInt8}, Cint, UInt32), input, length, previousCrc32)
end

