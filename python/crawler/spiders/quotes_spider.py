import scrapy
import time

#for main page
#s = response.selector.xpath('//td[@id="blocGauche"]/div[1]')[0]
#categories = s.xpath('//div[@class="bloc menu"]/div/a[@class="mot"]/@href').extract()
categories = [
 # '-ranma-1-2,42-.html',
 '-Cats-2-.html',
 '-Castels-.html',
 '-Humanized-.html',
 '-Explosivs-.html',
 # '-Aliens,128-.html',
 '-Angels-.html',
 '-Animals-.html',
 '-Babies-.html',
 '-Birds-and-insects-.html',
 '-Birthday-.html',
 '-Buildings-.html',
 '-Cartoons-.html',
 '-Clothes-.html',
 '-Computers-.html',
 '-Peoples-.html',
 '-Edges-and-Funds-.html',
 '-Geometry-.html',
 '-Halloween,58-.html',
 '-Islands-.html',
 '-Logos,50-.html',
 '-For-lovers-.html',
 '-Mangas,48-.html',
 '-Mens-.html',
 '-Miscelleneaous-.html',
 '-Movies-.html',
 '-Paris,32-.html',
 '-Police,150-.html',
 '-Robots,24-.html',
 '-Death-Co-.html',
 '-Sports,18-.html',
 '-Texts-.html',
 '-Transport,156-.html',
 '-Trucks-.html',
 '-Celebrities-.html',
]

#http://ricostacruz.com/cheatsheets/xpath.html
# scrapy shell http://www.asciiworld.com/
# scrapy crawl ascii_test -o crawl1.json


class ASCIISpider(scrapy.Spider):
    name = 'ascii_test'


    root_url = 'http://www.asciiworld.com/'

    def start_requests(self):

        for c in categories:
            print(f"crawling ${c}")
            time.sleep(1)
            url = ASCIISpider.root_url + c
            yield scrapy.Request(url=url, callback=self.parse)

    def parse_sub_cat(self, response):
        ascii_arts = response.selector.xpath(
                '//td[@id="blocCentre"]/div/div/table/tr/td/table/tr/td/pre/text()').extract()


        for ascii in ascii_arts:
            yield {
                'text': ascii,
                'url': response.url,
            }


    def parse(self, response):
        ascii_tables = response.selector.xpath('//td[@id="blocCentre"]/div/div/table')
        if len(ascii_tables) == 2:
            sub_categories = ascii_tables[0].xpath('//table/tr/td/div/a/@href')
            ascii_arts = ascii_tables[1].xpath('//table/tr/td/pre/text()').extract()

            for sub_cat in sub_categories:
                time.sleep(0.5)
                url = ASCIISpider.root_url + sub_cat.extract()
                yield scrapy.Request(url, self.parse_sub_cat )
        else:
            ascii_arts = ascii_tables[0].xpath('//table/tr/td/pre/text()').extract()


        for ascii in ascii_arts:
            yield {
                'text': ascii,
                'url': response.url,
            }
