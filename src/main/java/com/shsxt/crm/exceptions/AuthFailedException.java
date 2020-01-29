package com.shsxt.crm.exceptions;

/**
 * 自定义参数异常
 */
public class AuthFailedException extends RuntimeException {
    private Integer code=300;
    private String msg="权限不足!";


    public AuthFailedException() {
        super("权限不足!");
    }

    public AuthFailedException(String msg) {
        super(msg);
        this.msg = msg;
    }

    public AuthFailedException(Integer code) {
        super("权限不足!");
        this.code = code;
    }

    public AuthFailedException(Integer code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
