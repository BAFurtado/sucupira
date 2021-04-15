# Originally by Beatriz Domingues
# Adapted by Bernardo A Furtado

import pandas as pd
import requests
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.support.ui import Select

# Chrome path and options
path = '/home/furtadobb/MyModels/sucupira/chromedrive'
options = webdriver.ChromeOptions()
options.add_argument("no-sandbox")
options.add_argument("--disable-gpu")
options.add_argument("--window-size=800,600")
options.add_argument("--disable-dev-shm-usage")
options.add_argument("--headless")
sleep_sec = 8


def get_a_driver(url):
    driver = webdriver.Chrome(path, options=options)
    driver.implicitly_wait(2)
    driver.get(url)
    return driver


def set_codigo_instituicao(driver, nome):

    try:
        search_institution = driver.find_element_by_id("form:j_idt30:inst:input")
        time.sleep(5)
        search_institution.clear()
        search_institution.send_keys(nome)
        time.sleep(10)
    except NoSuchElementException:
        return False
    return True


def get_nomes_programas(driver):
    programas = []
    i = 1
    for select in driver.find_elements_by_css_selector('select'):
        value = select.get_attribute('name')
        if i == 3:
            j = 0
            for tag in driver.find_elements_by_css_selector('select[name="' + value + '"] option'):
                text = tag.text
                if j > 0:
                    programas.append(text)
                j += 1
        i += 1
    return programas


def set_nome_programa(nome, driver):
    programas = list()
    i = 1
    for select in driver.find_elements_by_css_selector('select'):
        value = select.get_attribute('name')
        if i == 3:
            select.send_keys(nome)
        i += 1


def click_nome_instituicao(driver):
    i = 1
    for select in driver.find_elements_by_css_selector('select'):
        value = select.get_attribute('name')
        if i == 2:
            search_institution = driver.find_element_by_xpath("//select[@name='" + value + "']")
            search_institution.click()
        i += 1


def click_botao_consultar(driver):
    try:
        botao_consultar = driver.find_element_by_id('form:consultar')
        time.sleep(sleep_sec)
        botao_consultar.click()
        time.sleep(sleep_sec)
    except NoSuchElementException:
        return False
    return True


if __name__ == '__main__':
    sem_resultados = list()

    data = pd.read_csv('universidades.csv', sep=';')
    site = "https://sucupira.capes.gov.br/sucupira/public/consultas/coleta/envioColeta/dadosFotoEnvioColeta.jsf"

    # create a new Chrome session
    d = get_a_driver(site)
    enap = 53013018
    ipea = 53012011
    set_codigo_instituicao(d, enap)
