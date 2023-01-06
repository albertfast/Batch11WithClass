With Sharing --> Class A [trigger, vf page, lwc --> with sharing.]
    -->call method of class C.
    -->call method of class B.

Inherit Sharing --> Class B [with sharing when called from Class A]
                            [trigger, vf page, lwc --> with sharing.]
                            [Without sharing when called from Class C.]

Without sharing --> Class C [without sharing rules]                           
                            [trigger, vf page, lwc --> without sharing.]
        -->Call method of class B

Omitted sharing --> class D [with sharing when called from Class A]
                        [trigger, vf page, lwc --> without sharing.]
                        [Without sharing when called from Class C.]