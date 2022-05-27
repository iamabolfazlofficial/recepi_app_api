FROM python:3.7-alpine
MAINTAINER Abolfazl Masoumi

# کاری که این می کند این است که به پایتون می گوید در حالت بدون بافر اجرا شود
ENV PYTHONUNBUFFERED 1

# در این مرحله باید وابستگی ها را نصب کنیم
COPY ./requirments.txt /requirments.txt
# اجرای دستور pip
# کاری که این می کند است است که پیپ قایل نیازمندی هایی که کپی کرده ایم را نصب می کند
RUN pip install -r /requirments.txt

# کاری که  این می کند یک پوشه خالی ایجاد می کند به نام app
# سپس به عنوان دایرکتوری پیشغرض تغییر می کند
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# بیشنر برای مباحث امنیتی می باشد که هر کاربری نتواند Docker Image  را تغییر دهد
# یا عملیات شرور انجام دهد
RUN adduser -D user
USER user