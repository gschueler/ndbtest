package com.dtolabs.ndb

class Node {
    String name
    String hostname
    String osFamily
    String osVersion
    String osArch
    String osName
    String username
    String project

    static constraints = {
        name(nullable:false,blank:false,unique:true)
        hostname(nullable:false,blank:false)
        username(nullable:false,blank:false)
        osFamily(blank:true)
        osVersion(blank:true)
        osArch(blank:true)
        osName(blank:true)
        project(nullable:false,blank:false)
        
    }
}
