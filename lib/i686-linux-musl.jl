using CEnum

"""
    aws_checksums_crc32(input, length, previous_crc32)

The entry point function to perform a CRC32 (Ethernet, gzip) computation. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc32 parameter as an initial value unless continuing to update a running crc in a subsequent call.

### Prototype
```c
uint32_t aws_checksums_crc32(const uint8_t *input, int length, uint32_t previous_crc32);
```
"""
function aws_checksums_crc32(input, length, previous_crc32)
    ccall((:aws_checksums_crc32, libaws_checksums), UInt32, (Ptr{UInt8}, Cint, UInt32), input, length, previous_crc32)
end

"""
    aws_checksums_crc32_ex(input, length, previous_crc32)

The entry point function to perform a CRC32 (Ethernet, gzip) computation. Supports buffer lengths up to size\\_t max. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc32 parameter as an initial value unless continuing to update a running crc in a subsequent call.

### Prototype
```c
uint32_t aws_checksums_crc32_ex(const uint8_t *input, size_t length, uint32_t previous_crc32);
```
"""
function aws_checksums_crc32_ex(input, length, previous_crc32)
    ccall((:aws_checksums_crc32_ex, libaws_checksums), UInt32, (Ptr{UInt8}, Csize_t, UInt32), input, length, previous_crc32)
end

"""
    aws_checksums_crc32c(input, length, previous_crc32c)

The entry point function to perform a Castagnoli CRC32c (iSCSI) computation. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc32 parameter as an initial value unless continuing to update a running crc in a subsequent call.

### Prototype
```c
uint32_t aws_checksums_crc32c(const uint8_t *input, int length, uint32_t previous_crc32c);
```
"""
function aws_checksums_crc32c(input, length, previous_crc32c)
    ccall((:aws_checksums_crc32c, libaws_checksums), UInt32, (Ptr{UInt8}, Cint, UInt32), input, length, previous_crc32c)
end

"""
    aws_checksums_crc32c_ex(input, length, previous_crc32c)

The entry point function to perform a Castagnoli CRC32c (iSCSI) computation. Supports buffer lengths up to size\\_t max. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc32 parameter as an initial value unless continuing to update a running crc in a subsequent call.

### Prototype
```c
uint32_t aws_checksums_crc32c_ex(const uint8_t *input, size_t length, uint32_t previous_crc32c);
```
"""
function aws_checksums_crc32c_ex(input, length, previous_crc32c)
    ccall((:aws_checksums_crc32c_ex, libaws_checksums), UInt32, (Ptr{UInt8}, Csize_t, UInt32), input, length, previous_crc32c)
end

"""
    aws_checksums_crc64nvme(input, length, previous_crc64)

The entry point function to perform a CRC64-NVME (a.k.a. CRC64-Rocksoft) computation. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc64 parameter as an initial value unless continuing to update a running crc in a subsequent call. There are many variants of CRC64 algorithms. This CRC64 variant is bit-reflected (based on the non bit-reflected polynomial 0xad93d23594c93659) and inverts the CRC input and output bits.

### Prototype
```c
uint64_t aws_checksums_crc64nvme(const uint8_t *input, int length, uint64_t previous_crc64);
```
"""
function aws_checksums_crc64nvme(input, length, previous_crc64)
    ccall((:aws_checksums_crc64nvme, libaws_checksums), UInt64, (Ptr{UInt8}, Cint, UInt64), input, length, previous_crc64)
end

"""
    aws_checksums_crc64nvme_ex(input, length, previous_crc64)

The entry point function to perform a CRC64-NVME (a.k.a. CRC64-Rocksoft) computation. Supports buffer lengths up to size\\_t max. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc64 parameter as an initial value unless continuing to update a running crc in a subsequent call. There are many variants of CRC64 algorithms. This CRC64 variant is bit-reflected (based on the non bit-reflected polynomial 0xad93d23594c93659) and inverts the CRC input and output bits.

### Prototype
```c
uint64_t aws_checksums_crc64nvme_ex(const uint8_t *input, size_t length, uint64_t previous_crc64);
```
"""
function aws_checksums_crc64nvme_ex(input, length, previous_crc64)
    ccall((:aws_checksums_crc64nvme_ex, libaws_checksums), UInt64, (Ptr{UInt8}, Csize_t, UInt64), input, length, previous_crc64)
end

