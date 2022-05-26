package com.kh.exam4;

public class WithdrawOverException extends Throwable {

    public WithdrawOverException() {
    }

    public WithdrawOverException(String message) {
        super(message);
    }

    public WithdrawOverException(String message, Throwable cause) {
        super(message, cause);
    }

    public WithdrawOverException(Throwable cause) {
        super(cause);
    }

    public WithdrawOverException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
