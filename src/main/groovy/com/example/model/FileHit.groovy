package com.example.model


class FileHit {
    public String name;
    public Long size;
    public float fileSize;
    public String sizeType;

    FileHit(String name, Long size) {
        this.name = name;
        this.size = size;
    }
}
