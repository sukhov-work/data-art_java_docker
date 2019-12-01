package org.springframework.internal.svm;

import com.oracle.svm.core.annotate.Substitute;
import com.oracle.svm.core.annotate.TargetClass;

@TargetClass(className="sun.reflect.Reflection", onlyWith = OnlyPresent.class)
public final class Target_sun_reflect_Reflection {

    @Substitute
    public static Class<?> getCallerClass(int depth) {
        return null;
    }
}
