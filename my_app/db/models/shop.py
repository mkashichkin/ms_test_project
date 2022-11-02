import datetime
import sqlalchemy
from sqlalchemy import orm
from my_app.db.db_session import SqlAlchemyBase


class Shop(SqlAlchemyBase):
    __tablename__ = 'shops'
    id = sqlalchemy.Column(sqlalchemy.Integer, primary_key=True, autoincrement=True)
    shop_name = sqlalchemy.Column(sqlalchemy.String, nullable=False)
    city_id = sqlalchemy.Column(sqlalchemy.Integer, sqlalchemy.ForeignKey("cities.id"))
    street_id = sqlalchemy.Column(sqlalchemy.Integer, sqlalchemy.ForeignKey("streets.id"))
    home = sqlalchemy.Column(sqlalchemy.String, nullable=False)
    time_open = sqlalchemy.Column(sqlalchemy.Time, nullable=False)
    time_close = sqlalchemy.Column(sqlalchemy.Time, nullable=False)

    city = orm.relation('City')
    street = orm.relation('Street')

    def __init__(self, shop_name, city_id, street_id, home, time_open, time_close):
        self.shop_name = shop_name
        self.city_id = city_id
        self.street_id = street_id
        self.home = home
        self.time_open = time_open
        self.time_close = time_close


    def __repr__(self):
        return f'Shop.id: {self.id}, Shop.shop_name: {self.shop_name}, City: {self.city.city_name},' \
               f'Street: {self.street.street_name}, Home: {self.home}, Time_Open: {self.time_open}, Time_close: {self.time_close}'

    def __str__(self):
        return f'Shop.id: {self.id}, Shop.shop_name: {self.shop_name}, City: {self.city.city_name},' \
               f'Street: {self.street.street_name}, Home: {self.home}, Time_Open: {self.time_open}, Time_close: {self.time_close}'