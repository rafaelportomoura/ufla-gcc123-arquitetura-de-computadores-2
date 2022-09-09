# A cifra de César

A cifra de César é um dos métodos mais simples de criptografia. É um tipo de cifra de substituição
na qual cada letra do texto é substituída por outra, por um deslocamento fixo de posições das letras
do alfabeto. Dado um arquivo texto, realize a cifragem de César usando instruções de permutação
e apresente o arquivo de saída cifrado. Considere que o processo possa ser revertido e que o arquivo
original possa ser recuperado e apresentado.



<table border="0" width="100%">
  <tr>
    <td width="10%">&nbsp;</td>
    <td width="80%">
      <h1 align="center"><font color="#000000">TABELA ASCII</font></h1>
      <h2 align="center"><font color="#000000">American Standard Code for
      Information Interchange</font></h2>
      <p>&nbsp;</p>
      <p>Nesta tabela estão representados os caracteres ASCII e a sua
      numeração octal, decimal e hexadecimal. Os caracteres que estão entre parênteses
      são caracteres que não são imprimíveis, na <a href="#Tabela 2"> tabela 2</a> são apresentados
      alguns desses caracteres mais comuns.</p>
    </td>
    <td width="10%">&nbsp;</td>
  </tr>
</tbody></table>
      <p>&nbsp;</p>
      <table border="0" width="100%">
        <tbody><tr>
          <td width="10%"></td>
          <td width="20%">
            <table border="1" width="100%" bordercolor="#000000">
              <tbody><tr>
                <td width="25%" align="center">Caracter</td>
                <td width="25%" align="center"> Dec</td>
                <td width="23%" align="center">Oct</td>
                <td width="27%" align="center"> Hex</td>
              </tr>
              <tr>
                <td width="25%" align="center">(nul)</td>
                <td width="25%" align="center">0</td>
                <td width="23%" align="center">0000</td>
                <td width="27%" align="center">0x00</td>
              </tr>
              <tr>
                <td width="25%" align="center">(soh)</td>
                <td width="25%" align="center">1</td>
                <td width="23%" align="center">0001</td>
                <td width="27%" align="center">0x01</td>
              </tr>
              <tr>
                <td width="25%" align="center">(stx)</td>
                <td width="25%" align="center">2</td>
                <td width="23%" align="center">0002</td>
                <td width="27%" align="center">0x02</td>
              </tr>
              <tr>
                <td width="25%" align="center">(etx)</td>
                <td width="25%" align="center">3</td>
                <td width="23%" align="center">0003</td>
                <td width="27%" align="center">0x03</td>
              </tr>
              <tr>
                <td width="25%" align="center">(eot)</td>
                <td width="25%" align="center">4</td>
                <td width="23%" align="center">0004</td>
                <td width="27%" align="center">0x04</td>
              </tr>
              <tr>
                <td width="25%" align="center">(enq)</td>
                <td width="25%" align="center">5</td>
                <td width="23%" align="center">0005</td>
                <td width="27%" align="center">0x05</td>
              </tr>
              <tr>
                <td width="25%" align="center">(ack)</td>
                <td width="25%" align="center">6</td>
                <td width="23%" align="center">0006</td>
                <td width="27%" align="center">0x06</td>
              </tr>
              <tr>
                <td width="25%" align="center">(bel)</td>
                <td width="25%" align="center">7</td>
                <td width="23%" align="center">0007</td>
                <td width="27%" align="center">0x07</td>
              </tr>
              <tr>
                <td width="25%" align="center">(bs)</td>
                <td width="25%" align="center">8</td>
                <td width="23%" align="center">0010</td>
                <td width="27%" align="center">0x08</td>
              </tr>
              <tr>
                <td width="25%" align="center">(ht)</td>
                <td width="25%" align="center">9</td>
                <td width="23%" align="center">0011</td>
                <td width="27%" align="center">0x09</td>
              </tr>
              <tr>
                <td width="25%" align="center">(nl)</td>
                <td width="25%" align="center">10</td>
                <td width="23%" align="center">0012</td>
                <td width="27%" align="center">0x0a</td>
              </tr>
              <tr>
                <td width="25%" align="center">(vt)</td>
                <td width="25%" align="center">11</td>
                <td width="23%" align="center">0013</td>
                <td width="27%" align="center">0x0b</td>
              </tr>
              <tr>
                <td width="25%" align="center">(np)</td>
                <td width="25%" align="center">12</td>
                <td width="23%" align="center">0014</td>
                <td width="27%" align="center">0x0c</td>
              </tr>
              <tr>
                <td width="25%" align="center">(cr)</td>
                <td width="25%" align="center">13</td>
                <td width="23%" align="center">0015</td>
                <td width="27%" align="center">0x0d</td>
              </tr>
              <tr>
                <td width="25%" align="center">(so)</td>
                <td width="25%" align="center">14</td>
                <td width="23%" align="center">0016</td>
                <td width="27%" align="center">0x0e</td>
              </tr>
              <tr>
                <td width="25%" align="center">(si)</td>
                <td width="25%" align="center">15</td>
                <td width="23%" align="center">0017</td>
                <td width="27%" align="center">0x0f</td>
              </tr>
              <tr>
                <td width="25%" align="center">(dle)</td>
                <td width="25%" align="center">16</td>
                <td width="23%" align="center">0020</td>
                <td width="27%" align="center">0x10</td>
              </tr>
              <tr>
                <td width="25%" align="center">(dc1)</td>
                <td width="25%" align="center">17</td>
                <td width="23%" align="center">0021</td>
                <td width="27%" align="center">0x11</td>
              </tr>
              <tr>
                <td width="25%" align="center">(dc2)</td>
                <td width="25%" align="center">18</td>
                <td width="23%" align="center">0022</td>
                <td width="27%" align="center">0x12</td>
              </tr>
              <tr>
                <td width="25%" align="center">(dc3)</td>
                <td width="25%" align="center">19</td>
                <td width="23%" align="center">0023</td>
                <td width="27%" align="center">0x13</td>
              </tr>
              <tr>
                <td width="25%" align="center">(dc4)</td>
                <td width="25%" align="center">20</td>
                <td width="23%" align="center">0024</td>
                <td width="27%" align="center">0x14</td>
              </tr>
              <tr>
                <td width="25%" align="center">(nak)</td>
                <td width="25%" align="center">21</td>
                <td width="23%" align="center">0025</td>
                <td width="27%" align="center">0x15</td>
              </tr>
              <tr>
                <td width="25%" align="center">(syn)</td>
                <td width="25%" align="center">22</td>
                <td width="23%" align="center">0026</td>
                <td width="27%" align="center">0x16</td>
              </tr>
              <tr>
                <td width="25%" align="center">(etb)</td>
                <td width="25%" align="center">23</td>
                <td width="23%" align="center">0027</td>
                <td width="27%" align="center">0x17</td>
              </tr>
              <tr>
                <td width="25%" align="center">(can)</td>
                <td width="25%" align="center">24</td>
                <td width="23%" align="center">0030</td>
                <td width="27%" align="center">0x18</td>
              </tr>
              <tr>
                <td width="25%" align="center">(em)</td>
                <td width="25%" align="center">25</td>
                <td width="23%" align="center">0031</td>
                <td width="27%" align="center">0x19</td>
              </tr>
              <tr>
                <td width="25%" align="center">(sub)</td>
                <td width="25%" align="center">26</td>
                <td width="23%" align="center">0032</td>
                <td width="27%" align="center">0x1a</td>
              </tr>
              <tr>
                <td width="25%" align="center">(esc)</td>
                <td width="25%" align="center">27</td>
                <td width="23%" align="center">0033</td>
                <td width="27%" align="center">0x1b</td>
              </tr>
              <tr>
                <td width="25%" align="center">(fs)</td>
                <td width="25%" align="center">28</td>
                <td width="23%" align="center">0034</td>
                <td width="27%" align="center">0x1c</td>
              </tr>
              <tr>
                <td width="25%" align="center">(gs)</td>
                <td width="25%" align="center">29</td>
                <td width="23%" align="center">0035</td>
                <td width="27%" align="center">0x1d</td>
              </tr>
              <tr>
                <td width="25%" align="center">(rs)</td>
                <td width="25%" align="center">30</td>
                <td width="23%" align="center">0036</td>
                <td width="27%" align="center">0x1e</td>
              </tr>
              <tr>
                <td width="25%" align="center">(us)</td>
                <td width="25%" align="center">31</td>
                <td width="23%" align="center">0037</td>
                <td width="27%" align="center">0x1f</td>
              </tr>
              <tr>
                <td width="25%" align="center">(space)</td>
                <td width="25%" align="center">32</td>
                <td width="23%" align="center">0040</td>
                <td width="27%" align="center">0x20</td>
              </tr>
              <tr>
                <td width="25%" align="center">!</td>
                <td width="25%" align="center">33</td>
                <td width="23%" align="center">0041</td>
                <td width="27%" align="center">0x21</td>
              </tr>
              <tr>
                <td width="25%" align="center">"</td>
                <td width="25%" align="center">34</td>
                <td width="23%" align="center">0042</td>
                <td width="27%" align="center">0x22</td>
              </tr>
              <tr>
                <td width="25%" align="center">#</td>
                <td width="25%" align="center">35</td>
                <td width="23%" align="center">0043</td>
                <td width="27%" align="center">0x23</td>
              </tr>
              <tr>
                <td width="25%" align="center">$</td>
                <td width="25%" align="center">36</td>
                <td width="23%" align="center">0044</td>
                <td width="27%" align="center">0x24</td>
              </tr>
              <tr>
                <td width="25%" align="center">%</td>
                <td width="25%" align="center">37</td>
                <td width="23%" align="center">0045</td>
                <td width="27%" align="center">0x25</td>
              </tr>
              <tr>
                <td width="25%" align="center">&amp;</td>
                <td width="25%" align="center">38</td>
                <td width="23%" align="center">0046</td>
                <td width="27%" align="center">0x26</td>
              </tr>
              <tr>
                <td width="25%" align="center">'</td>
                <td width="25%" align="center">39</td>
                <td width="23%" align="center">0047</td>
                <td width="27%" align="center">0x27</td>
              </tr>
              <tr>
                <td width="25%" align="center">(</td>
                <td width="25%" align="center">40</td>
                <td width="23%" align="center">0050</td>
                <td width="27%" align="center">0x28</td>
              </tr>
              <tr>
                <td width="25%" align="center">)</td>
                <td width="25%" align="center">41</td>
                <td width="23%" align="center">0051</td>
                <td width="27%" align="center">0x29</td>
              </tr>
              <tr>
                <td width="25%" align="center">*</td>
                <td width="25%" align="center">42</td>
                <td width="23%" align="center">0052</td>
                <td width="27%" align="center">0x2a</td>
              </tr>
              <tr>
                <td width="25%" align="center">+</td>
                <td width="25%" align="center">43</td>
                <td width="23%" align="center">0053</td>
                <td width="27%" align="center">0x2b</td>
              </tr>
              <tr>
                <td width="25%" align="center">,</td>
                <td width="25%" align="center">44</td>
                <td width="23%" align="center">0054</td>
                <td width="27%" align="center">0x2c</td>
              </tr>
              <tr>
                <td width="25%" align="center">-</td>
                <td width="25%" align="center">45</td>
                <td width="23%" align="center">0055</td>
                <td width="27%" align="center">0x2d</td>
              </tr>
              <tr>
                <td width="25%" align="center">.</td>
                <td width="25%" align="center">46</td>
                <td width="23%" align="center">0056</td>
                <td width="27%" align="center">0x2e</td>
              </tr>
              <tr>
                <td width="25%" align="center">/</td>
                <td width="25%" align="center">47</td>
                <td width="23%" align="center">0057</td>
                <td width="27%" align="center">0x2f</td>
              </tr>
              <tr>
                <td width="25%" align="center">0</td>
                <td width="25%" align="center">48</td>
                <td width="23%" align="center">0060</td>
                <td width="27%" align="center">0x30</td>
              </tr>
              <tr>
                <td width="25%" align="center">1</td>
                <td width="25%" align="center">49</td>
                <td width="23%" align="center">0061</td>
                <td width="27%" align="center">0x31</td>
              </tr>
              <tr>
                <td width="25%" align="center">2</td>
                <td width="25%" align="center">50</td>
                <td width="23%" align="center">0062</td>
                <td width="27%" align="center">0x32</td>
              </tr>
              <tr>
                <td width="25%" align="center">3</td>
                <td width="25%" align="center">51</td>
                <td width="23%" align="center">0063</td>
                <td width="27%" align="center">0x33</td>
              </tr>
              <tr>
                <td width="25%" align="center">4</td>
                <td width="25%" align="center">52</td>
                <td width="23%" align="center">0064</td>
                <td width="27%" align="center">0x34</td>
              </tr>
              <tr>
                <td width="25%" align="center">5</td>
                <td width="25%" align="center">53</td>
                <td width="23%" align="center">0065</td>
                <td width="27%" align="center">0x35</td>
              </tr>
              <tr>
                <td width="25%" align="center">6</td>
                <td width="25%" align="center">54</td>
                <td width="23%" align="center">0066</td>
                <td width="27%" align="center">0x36</td>
              </tr>
              <tr>
                <td width="25%" align="center">7</td>
                <td width="25%" align="center">55</td>
                <td width="23%" align="center">0067</td>
                <td width="27%" align="center">0x37</td>
              </tr>
              <tr>
                <td width="25%" align="center">8</td>
                <td width="25%" align="center">56</td>
                <td width="23%" align="center">0070</td>
                <td width="27%" align="center">0x38</td>
              </tr>
              <tr>
                <td width="25%" align="center">9</td>
                <td width="25%" align="center">57</td>
                <td width="23%" align="center">0071</td>
                <td width="27%" align="center">0x39</td>
              </tr>
              <tr>
                <td width="25%" align="center">:</td>
                <td width="25%" align="center">58</td>
                <td width="23%" align="center">0072</td>
                <td width="27%" align="center">0x3a</td>
              </tr>
              <tr>
                <td width="25%" align="center">;</td>
                <td width="25%" align="center">59</td>
                <td width="23%" align="center">0073</td>
                <td width="27%" align="center">0x3b</td>
              </tr>
              <tr>
                <td width="25%" align="center">&lt;</td>
                <td width="25%" align="center">60</td>
                <td width="23%" align="center">0074</td>
                <td width="27%" align="center">0x3c</td>
              </tr>
              <tr>
                <td width="25%" align="center">=</td>
                <td width="25%" align="center">61</td>
                <td width="23%" align="center">0075</td>
                <td width="27%" align="center">0x3d</td>
              </tr>
              <tr>
                <td width="25%" align="center">&gt;</td>
                <td width="25%" align="center">62</td>
                <td width="23%" align="center">0076</td>
                <td width="27%" align="center">0x3e</td>
              </tr>
              <tr>
                <td width="25%" align="center">?</td>
                <td width="25%" align="center">63</td>
                <td width="23%" align="center">0077</td>
                <td width="27%" align="center">0x3f</td>
              </tr>
            </tbody></table>
          </td>
          <td width="20%">
            <table border="1" width="100%" bordercolor="#000000">
              <tbody><tr>
                <td width="25%" align="center">Caracter</td>
                <td width="25%" align="center"> Dec</td>
                <td width="23%" align="center">Oct</td>
                <td width="27%" align="center"> Hex</td>
              </tr>
              <tr>
                <td width="25%" align="center">@</td>
                <td width="25%" align="center">64</td>
                <td width="23%" align="center">0100</td>
                <td width="27%" align="center">0x40</td>
              </tr>
              <tr>
                <td width="25%" align="center">A</td>
                <td width="25%" align="center">65</td>
                <td width="23%" align="center">0101</td>
                <td width="27%" align="center">0x41</td>
              </tr>
              <tr>
                <td width="25%" align="center">B</td>
                <td width="25%" align="center">66</td>
                <td width="23%" align="center">0102</td>
                <td width="27%" align="center">0x42</td>
              </tr>
              <tr>
                <td width="25%" align="center">C</td>
                <td width="25%" align="center">67</td>
                <td width="23%" align="center">0103</td>
                <td width="27%" align="center">0x43</td>
              </tr>
              <tr>
                <td width="25%" align="center">D</td>
                <td width="25%" align="center">68</td>
                <td width="23%" align="center">0104</td>
                <td width="27%" align="center">0x44</td>
              </tr>
              <tr>
                <td width="25%" align="center">E</td>
                <td width="25%" align="center">69</td>
                <td width="23%" align="center">0105</td>
                <td width="27%" align="center">0x45</td>
              </tr>
              <tr>
                <td width="25%" align="center">F</td>
                <td width="25%" align="center">70</td>
                <td width="23%" align="center">0106</td>
                <td width="27%" align="center">0x46</td>
              </tr>
              <tr>
                <td width="25%" align="center">G</td>
                <td width="25%" align="center">71</td>
                <td width="23%" align="center">0107</td>
                <td width="27%" align="center">0x47</td>
              </tr>
              <tr>
                <td width="25%" align="center">H</td>
                <td width="25%" align="center">72</td>
                <td width="23%" align="center">0110</td>
                <td width="27%" align="center">0x48</td>
              </tr>
              <tr>
                <td width="25%" align="center">I</td>
                <td width="25%" align="center">73</td>
                <td width="23%" align="center">0111</td>
                <td width="27%" align="center">0x49</td>
              </tr>
              <tr>
                <td width="25%" align="center">J</td>
                <td width="25%" align="center">74</td>
                <td width="23%" align="center">0112</td>
                <td width="27%" align="center">0x4a</td>
              </tr>
              <tr>
                <td width="25%" align="center">K</td>
                <td width="25%" align="center">75</td>
                <td width="23%" align="center">0113</td>
                <td width="27%" align="center">0x4b</td>
              </tr>
              <tr>
                <td width="25%" align="center">L</td>
                <td width="25%" align="center">76</td>
                <td width="23%" align="center">0114</td>
                <td width="27%" align="center">0x4c</td>
              </tr>
              <tr>
                <td width="25%" align="center">M</td>
                <td width="25%" align="center">77</td>
                <td width="23%" align="center">0115</td>
                <td width="27%" align="center">0x4d</td>
              </tr>
              <tr>
                <td width="25%" align="center">N</td>
                <td width="25%" align="center">78</td>
                <td width="23%" align="center">0116</td>
                <td width="27%" align="center">0x4e</td>
              </tr>
              <tr>
                <td width="25%" align="center">O</td>
                <td width="25%" align="center">79</td>
                <td width="23%" align="center">0117</td>
                <td width="27%" align="center">0x4f</td>
              </tr>
              <tr>
                <td width="25%" align="center">P</td>
                <td width="25%" align="center">80</td>
                <td width="23%" align="center">0120</td>
                <td width="27%" align="center">0x50</td>
              </tr>
              <tr>
                <td width="25%" align="center">Q</td>
                <td width="25%" align="center">81</td>
                <td width="23%" align="center">0121</td>
                <td width="27%" align="center">0x51</td>
              </tr>
              <tr>
                <td width="25%" align="center">R</td>
                <td width="25%" align="center">82</td>
                <td width="23%" align="center">0122</td>
                <td width="27%" align="center">0x52</td>
              </tr>
              <tr>
                <td width="25%" align="center">S</td>
                <td width="25%" align="center">83</td>
                <td width="23%" align="center">0123</td>
                <td width="27%" align="center">0x53</td>
              </tr>
              <tr>
                <td width="25%" align="center">T</td>
                <td width="25%" align="center">84</td>
                <td width="23%" align="center">0124</td>
                <td width="27%" align="center">0x54</td>
              </tr>
              <tr>
                <td width="25%" align="center">U</td>
                <td width="25%" align="center">85</td>
                <td width="23%" align="center">0125</td>
                <td width="27%" align="center">0x55</td>
              </tr>
              <tr>
                <td width="25%" align="center">V</td>
                <td width="25%" align="center">86</td>
                <td width="23%" align="center">0126</td>
                <td width="27%" align="center">0x56</td>
              </tr>
              <tr>
                <td width="25%" align="center">W</td>
                <td width="25%" align="center">87</td>
                <td width="23%" align="center">0127</td>
                <td width="27%" align="center">0x57</td>
              </tr>
              <tr>
                <td width="25%" align="center">X</td>
                <td width="25%" align="center">88</td>
                <td width="23%" align="center">0130</td>
                <td width="27%" align="center">0x58</td>
              </tr>
              <tr>
                <td width="25%" align="center">Y</td>
                <td width="25%" align="center">89</td>
                <td width="23%" align="center">0131</td>
                <td width="27%" align="center">0x59</td>
              </tr>
              <tr>
                <td width="25%" align="center">Z</td>
                <td width="25%" align="center">90</td>
                <td width="23%" align="center">0132</td>
                <td width="27%" align="center">0x5a</td>
              </tr>
              <tr>
                <td width="25%" align="center">[</td>
                <td width="25%" align="center">91</td>
                <td width="23%" align="center">0133</td>
                <td width="27%" align="center">0x5b</td>
              </tr>
              <tr>
                <td width="25%" align="center">\</td>
                <td width="25%" align="center">92</td>
                <td width="23%" align="center">0134</td>
                <td width="27%" align="center">0x5c</td>
              </tr>
              <tr>
                <td width="25%" align="center">]</td>
                <td width="25%" align="center">93</td>
                <td width="23%" align="center">0135</td>
                <td width="27%" align="center">0x5d</td>
              </tr>
              <tr>
                <td width="25%" align="center">^</td>
                <td width="25%" align="center">94</td>
                <td width="23%" align="center">0136</td>
                <td width="27%" align="center">0x5e</td>
              </tr>
              <tr>
                <td width="25%" align="center">_</td>
                <td width="25%" align="center">95</td>
                <td width="23%" align="center">0137</td>
                <td width="27%" align="center">0x5f</td>
              </tr>
              <tr>
                <td width="25%" align="center">`</td>
                <td width="25%" align="center">96</td>
                <td width="23%" align="center">0140</td>
                <td width="27%" align="center">0x60</td>
              </tr>
              <tr>
                <td width="25%" align="center">a</td>
                <td width="25%" align="center">97</td>
                <td width="23%" align="center">0141</td>
                <td width="27%" align="center">0x61</td>
              </tr>
              <tr>
                <td width="25%" align="center">b</td>
                <td width="25%" align="center">98</td>
                <td width="23%" align="center">0142</td>
                <td width="27%" align="center">0x62</td>
              </tr>
              <tr>
                <td width="25%" align="center">c</td>
                <td width="25%" align="center">99</td>
                <td width="23%" align="center">0143</td>
                <td width="27%" align="center">0x63</td>
              </tr>
              <tr>
                <td width="25%" align="center">d</td>
                <td width="25%" align="center">100</td>
                <td width="23%" align="center">0144</td>
                <td width="27%" align="center">0x64</td>
              </tr>
              <tr>
                <td width="25%" align="center">e</td>
                <td width="25%" align="center">101</td>
                <td width="23%" align="center">0145</td>
                <td width="27%" align="center">0x65</td>
              </tr>
              <tr>
                <td width="25%" align="center">f</td>
                <td width="25%" align="center">102</td>
                <td width="23%" align="center">0146</td>
                <td width="27%" align="center">0x66</td>
              </tr>
              <tr>
                <td width="25%" align="center">g</td>
                <td width="25%" align="center">103</td>
                <td width="23%" align="center">0147</td>
                <td width="27%" align="center">0x67</td>
              </tr>
              <tr>
                <td width="25%" align="center">h</td>
                <td width="25%" align="center">104</td>
                <td width="23%" align="center">0150</td>
                <td width="27%" align="center">0x68</td>
              </tr>
              <tr>
                <td width="25%" align="center">i</td>
                <td width="25%" align="center">105</td>
                <td width="23%" align="center">0151</td>
                <td width="27%" align="center">0x69</td>
              </tr>
              <tr>
                <td width="25%" align="center">j</td>
                <td width="25%" align="center">106</td>
                <td width="23%" align="center">0152</td>
                <td width="27%" align="center">0x6a</td>
              </tr>
              <tr>
                <td width="25%" align="center">k</td>
                <td width="25%" align="center">107</td>
                <td width="23%" align="center">0153</td>
                <td width="27%" align="center">0x6b</td>
              </tr>
              <tr>
                <td width="25%" align="center">l</td>
                <td width="25%" align="center">108</td>
                <td width="23%" align="center">0154</td>
                <td width="27%" align="center">0x6c</td>
              </tr>
              <tr>
                <td width="25%" align="center">m</td>
                <td width="25%" align="center">109</td>
                <td width="23%" align="center">0155</td>
                <td width="27%" align="center">0x6d</td>
              </tr>
              <tr>
                <td width="25%" align="center">n</td>
                <td width="25%" align="center">110</td>
                <td width="23%" align="center">0156</td>
                <td width="27%" align="center">0x6e</td>
              </tr>
              <tr>
                <td width="25%" align="center">o</td>
                <td width="25%" align="center">111</td>
                <td width="23%" align="center">0157</td>
                <td width="27%" align="center">0x6f</td>
              </tr>
              <tr>
                <td width="25%" align="center">p</td>
                <td width="25%" align="center">112</td>
                <td width="23%" align="center">0160</td>
                <td width="27%" align="center">0x70</td>
              </tr>
              <tr>
                <td width="25%" align="center">q</td>
                <td width="25%" align="center">113</td>
                <td width="23%" align="center">0161</td>
                <td width="27%" align="center">0x71</td>
              </tr>
              <tr>
                <td width="25%" align="center">r</td>
                <td width="25%" align="center">114</td>
                <td width="23%" align="center">0162</td>
                <td width="27%" align="center">0x72</td>
              </tr>
              <tr>
                <td width="25%" align="center">s</td>
                <td width="25%" align="center">115</td>
                <td width="23%" align="center">0163</td>
                <td width="27%" align="center">0x73</td>
              </tr>
              <tr>
                <td width="25%" align="center">t</td>
                <td width="25%" align="center">116</td>
                <td width="23%" align="center">0164</td>
                <td width="27%" align="center">0x74</td>
              </tr>
              <tr>
                <td width="25%" align="center">u</td>
                <td width="25%" align="center">117</td>
                <td width="23%" align="center">0165</td>
                <td width="27%" align="center">0x75</td>
              </tr>
              <tr>
                <td width="25%" align="center">v</td>
                <td width="25%" align="center">118</td>
                <td width="23%" align="center">0166</td>
                <td width="27%" align="center">0x76</td>
              </tr>
              <tr>
                <td width="25%" align="center">w</td>
                <td width="25%" align="center">119</td>
                <td width="23%" align="center">0167</td>
                <td width="27%" align="center">0x77</td>
              </tr>
              <tr>
                <td width="25%" align="center">x</td>
                <td width="25%" align="center">120</td>
                <td width="23%" align="center">0170</td>
                <td width="27%" align="center">0x78</td>
              </tr>
              <tr>
                <td width="25%" align="center">y</td>
                <td width="25%" align="center">121</td>
                <td width="23%" align="center">0171</td>
                <td width="27%" align="center">0x79</td>
              </tr>
              <tr>
                <td width="25%" align="center">z</td>
                <td width="25%" align="center">122</td>
                <td width="23%" align="center">0172</td>
                <td width="27%" align="center">0x7a</td>
              </tr>
              <tr>
                <td width="25%" align="center">{</td>
                <td width="25%" align="center">123</td>
                <td width="23%" align="center">0173</td>
                <td width="27%" align="center">0x7b</td>
              </tr>
              <tr>
                <td width="25%" align="center">|</td>
                <td width="25%" align="center">124</td>
                <td width="23%" align="center">0174</td>
                <td width="27%" align="center">0x7c</td>
              </tr>
              <tr>
                <td width="25%" align="center">}</td>
                <td width="25%" align="center">125</td>
                <td width="23%" align="center">0175</td>
                <td width="27%" align="center">0x7d</td>
              </tr>
              <tr>
                <td width="25%" align="center">~</td>
                <td width="25%" align="center">126</td>
                <td width="23%" align="center">0176</td>
                <td width="27%" align="center">0x7e</td>
              </tr>
              <tr>
                <td width="25%" align="center">(del)</td>
                <td width="25%" align="center">127</td>
                <td width="23%" align="center">0177</td>
                <td width="27%" align="center">0x7f</td>
              </tr>
            </tbody></table>
          </td>
          <td width="20%">
            <table border="1" width="100%" bordercolor="#000000">
              <tbody><tr>
                <td width="25%" align="center">Caracter</td>
                <td width="25%" align="center"> Dec</td>
                <td width="23%" align="center">Oct</td>
                <td width="27%" align="center"> Hex</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ç</td>
                <td width="25%" align="center">128</td>
                <td width="23%" align="center">0200</td>
                <td width="27%" align="center">0x80</td>
              </tr>
              <tr>
                <td width="25%" align="center">ü</td>
                <td width="25%" align="center">129</td>
                <td width="23%" align="center">0201</td>
                <td width="27%" align="center">0x81</td>
              </tr>
              <tr>
                <td width="25%" align="center">é</td>
                <td width="25%" align="center">130</td>
                <td width="23%" align="center">0202</td>
                <td width="27%" align="center">0x82</td>
              </tr>
              <tr>
                <td width="25%" align="center">â</td>
                <td width="25%" align="center">131</td>
                <td width="23%" align="center">0203</td>
                <td width="27%" align="center">0x83</td>
              </tr>
              <tr>
                <td width="25%" align="center">ä</td>
                <td width="25%" align="center">132</td>
                <td width="23%" align="center">0204</td>
                <td width="27%" align="center">0x84</td>
              </tr>
              <tr>
                <td width="25%" align="center">à</td>
                <td width="25%" align="center">133</td>
                <td width="23%" align="center">0205</td>
                <td width="27%" align="center">0x85</td>
              </tr>
              <tr>
                <td width="25%" align="center">å</td>
                <td width="25%" align="center">134</td>
                <td width="23%" align="center">0206</td>
                <td width="27%" align="center">0x86</td>
              </tr>
              <tr>
                <td width="25%" align="center">ç</td>
                <td width="25%" align="center">135</td>
                <td width="23%" align="center">0207</td>
                <td width="27%" align="center">0x87</td>
              </tr>
              <tr>
                <td width="25%" align="center">ê</td>
                <td width="25%" align="center">136</td>
                <td width="23%" align="center">0210</td>
                <td width="27%" align="center">0x88</td>
              </tr>
              <tr>
                <td width="25%" align="center">ë</td>
                <td width="25%" align="center">137</td>
                <td width="23%" align="center">0211</td>
                <td width="27%" align="center">0x89</td>
              </tr>
              <tr>
                <td width="25%" align="center">è</td>
                <td width="25%" align="center">138</td>
                <td width="23%" align="center">0212</td>
                <td width="27%" align="center">0x8a</td>
              </tr>
              <tr>
                <td width="25%" align="center">ï</td>
                <td width="25%" align="center">139</td>
                <td width="23%" align="center">0213</td>
                <td width="27%" align="center">0x8b</td>
              </tr>
              <tr>
                <td width="25%" align="center">î</td>
                <td width="25%" align="center">140</td>
                <td width="23%" align="center">0214</td>
                <td width="27%" align="center">0x8c</td>
              </tr>
              <tr>
                <td width="25%" align="center">ì</td>
                <td width="25%" align="center">141</td>
                <td width="23%" align="center">0215</td>
                <td width="27%" align="center">0x8d</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ä</td>
                <td width="25%" align="center">142</td>
                <td width="23%" align="center">0216</td>
                <td width="27%" align="center">0x8e</td>
              </tr>
              <tr>
                <td width="25%" align="center">Å</td>
                <td width="25%" align="center">143</td>
                <td width="23%" align="center">0217</td>
                <td width="27%" align="center">0x8f</td>
              </tr>
              <tr>
                <td width="25%" align="center">É</td>
                <td width="25%" align="center">144</td>
                <td width="23%" align="center">0220</td>
                <td width="27%" align="center">0x90</td>
              </tr>
              <tr>
                <td width="25%" align="center">æ</td>
                <td width="25%" align="center">145</td>
                <td width="23%" align="center">0221</td>
                <td width="27%" align="center">0x91</td>
              </tr>
              <tr>
                <td width="25%" align="center">Æ</td>
                <td width="25%" align="center">146</td>
                <td width="23%" align="center">0222</td>
                <td width="27%" align="center">0x92</td>
              </tr>
              <tr>
                <td width="25%" align="center">ô</td>
                <td width="25%" align="center">147</td>
                <td width="23%" align="center">0223</td>
                <td width="27%" align="center">0x93</td>
              </tr>
              <tr>
                <td width="25%" align="center">ö</td>
                <td width="25%" align="center">148</td>
                <td width="23%" align="center">0224</td>
                <td width="27%" align="center">0x94</td>
              </tr>
              <tr>
                <td width="25%" align="center">ò</td>
                <td width="25%" align="center">149</td>
                <td width="23%" align="center">0225</td>
                <td width="27%" align="center">0x95</td>
              </tr>
              <tr>
                <td width="25%" align="center">û</td>
                <td width="25%" align="center">150</td>
                <td width="23%" align="center">0226</td>
                <td width="27%" align="center">0x96</td>
              </tr>
              <tr>
                <td width="25%" align="center">ù</td>
                <td width="25%" align="center">151</td>
                <td width="23%" align="center">0227</td>
                <td width="27%" align="center">0x97</td>
              </tr>
              <tr>
                <td width="25%" align="center">ÿ</td>
                <td width="25%" align="center">152</td>
                <td width="23%" align="center">0230</td>
                <td width="27%" align="center">0x98</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ö</td>
                <td width="25%" align="center">153</td>
                <td width="23%" align="center">0231</td>
                <td width="27%" align="center">0x99</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ü</td>
                <td width="25%" align="center">154</td>
                <td width="23%" align="center">0232</td>
                <td width="27%" align="center">0x9a</td>
              </tr>
              <tr>
                <td width="25%" align="center">ø</td>
                <td width="25%" align="center">155</td>
                <td width="23%" align="center">0233</td>
                <td width="27%" align="center">0x9b</td>
              </tr>
              <tr>
                <td width="25%" align="center">£</td>
                <td width="25%" align="center">156</td>
                <td width="23%" align="center">0234</td>
                <td width="27%" align="center">0x9c</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ø</td>
                <td width="25%" align="center">157</td>
                <td width="23%" align="center">0235</td>
                <td width="27%" align="center">0x9d</td>
              </tr>
              <tr>
                <td width="25%" align="center">×</td>
                <td width="25%" align="center">1158</td>
                <td width="23%" align="center">0236</td>
                <td width="27%" align="center">0x9e</td>
              </tr>
              <tr>
                <td width="25%" align="center">ƒ</td>
                <td width="25%" align="center">159</td>
                <td width="23%" align="center">0237</td>
                <td width="27%" align="center">0x9f</td>
              </tr>
              <tr>
                <td width="25%" align="center">á</td>
                <td width="25%" align="center">160</td>
                <td width="23%" align="center">0240</td>
                <td width="27%" align="center">0xa0</td>
              </tr>
              <tr>
                <td width="25%" align="center">í</td>
                <td width="25%" align="center">161</td>
                <td width="23%" align="center">0241</td>
                <td width="27%" align="center">0xa1</td>
              </tr>
              <tr>
                <td width="25%" align="center">ó</td>
                <td width="25%" align="center">162</td>
                <td width="23%" align="center">0242</td>
                <td width="27%" align="center">0xa2</td>
              </tr>
              <tr>
                <td width="25%" align="center">ú</td>
                <td width="25%" align="center">163</td>
                <td width="23%" align="center">0243</td>
                <td width="27%" align="center">0xa3</td>
              </tr>
              <tr>
                <td width="25%" align="center">ñ</td>
                <td width="25%" align="center">164</td>
                <td width="23%" align="center">0244</td>
                <td width="27%" align="center">0xa4</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ñ</td>
                <td width="25%" align="center">165</td>
                <td width="23%" align="center">0245</td>
                <td width="27%" align="center">0xa5</td>
              </tr>
              <tr>
                <td width="25%" align="center">ª</td>
                <td width="25%" align="center">166</td>
                <td width="23%" align="center">0246</td>
                <td width="27%" align="center">0xa6</td>
              </tr>
              <tr>
                <td width="25%" align="center">º</td>
                <td width="25%" align="center">167</td>
                <td width="23%" align="center">0247</td>
                <td width="27%" align="center">0xa7</td>
              </tr>
              <tr>
                <td width="25%" align="center">¿</td>
                <td width="25%" align="center">168</td>
                <td width="23%" align="center">0250</td>
                <td width="27%" align="center">0xa8</td>
              </tr>
              <tr>
                <td width="25%" align="center">®</td>
                <td width="25%" align="center">169</td>
                <td width="23%" align="center">0251</td>
                <td width="27%" align="center">0xa9</td>
              </tr>
              <tr>
                <td width="25%" align="center">¬</td>
                <td width="25%" align="center">170</td>
                <td width="23%" align="center">0252</td>
                <td width="27%" align="center">0xaa</td>
              </tr>
              <tr>
                <td width="25%" align="center">½</td>
                <td width="25%" align="center">171</td>
                <td width="23%" align="center">0253</td>
                <td width="27%" align="center">0xab</td>
              </tr>
              <tr>
                <td width="25%" align="center">¼</td>
                <td width="25%" align="center">172</td>
                <td width="23%" align="center">0254</td>
                <td width="27%" align="center">0xac</td>
              </tr>
              <tr>
                <td width="25%" align="center">¡</td>
                <td width="25%" align="center">173</td>
                <td width="23%" align="center">0255</td>
                <td width="27%" align="center">0xad</td>
              </tr>
              <tr>
                <td width="25%" align="center">«</td>
                <td width="25%" align="center">174</td>
                <td width="23%" align="center">0256</td>
                <td width="27%" align="center">0xae</td>
              </tr>
              <tr>
                <td width="25%" align="center">»</td>
                <td width="25%" align="center">175</td>
                <td width="23%" align="center">0257</td>
                <td width="27%" align="center">0xaf</td>
              </tr>
              <tr>
                <td width="25%" align="center">_</td>
                <td width="25%" align="center">176</td>
                <td width="23%" align="center">0260</td>
                <td width="27%" align="center">0xb0</td>
              </tr>
              <tr>
                <td width="25%" align="center">_</td>
                <td width="25%" align="center">177</td>
                <td width="23%" align="center">0261</td>
                <td width="27%" align="center">0xb1</td>
              </tr>
              <tr>
                <td width="25%" align="center">_</td>
                <td width="25%" align="center">178</td>
                <td width="23%" align="center">0262</td>
                <td width="27%" align="center">0xb2</td>
              </tr>
              <tr>
                <td width="25%" align="center">¦</td>
                <td width="25%" align="center">179</td>
                <td width="23%" align="center">0263</td>
                <td width="27%" align="center">0xb3</td>
              </tr>
              <tr>
                <td width="25%" align="center">¦</td>
                <td width="25%" align="center">180</td>
                <td width="23%" align="center">0264</td>
                <td width="27%" align="center">0xb4</td>
              </tr>
              <tr>
                <td width="25%" align="center">Á</td>
                <td width="25%" align="center">181</td>
                <td width="23%" align="center">0265</td>
                <td width="27%" align="center">0xb5</td>
              </tr>
              <tr>
                <td width="25%" align="center">Â</td>
                <td width="25%" align="center">192</td>
                <td width="23%" align="center">0266</td>
                <td width="27%" align="center">0xb6</td>
              </tr>
              <tr>
                <td width="25%" align="center">À</td>
                <td width="25%" align="center">183</td>
                <td width="23%" align="center">0267</td>
                <td width="27%" align="center">0xb7</td>
              </tr>
              <tr>
                <td width="25%" align="center">©</td>
                <td width="25%" align="center">184</td>
                <td width="23%" align="center">0270</td>
                <td width="27%" align="center">0xb8</td>
              </tr>
              <tr>
                <td width="25%" align="center">¦</td>
                <td width="25%" align="center">185</td>
                <td width="23%" align="center">0271</td>
                <td width="27%" align="center">0xb9</td>
              </tr>
              <tr>
                <td width="25%" align="center">¦</td>
                <td width="25%" align="center">186</td>
                <td width="23%" align="center">0272</td>
                <td width="27%" align="center">0xba</td>
              </tr>
              <tr>
                <td width="25%" align="center">+</td>
                <td width="25%" align="center">187</td>
                <td width="23%" align="center">0273</td>
                <td width="27%" align="center">0xbb</td>
              </tr>
              <tr>
                <td width="25%" align="center">+</td>
                <td width="25%" align="center">188</td>
                <td width="23%" align="center">0274</td>
                <td width="27%" align="center">0xbc</td>
              </tr>
              <tr>
                <td width="25%" align="center">¢</td>
                <td width="25%" align="center">189</td>
                <td width="23%" align="center">0275</td>
                <td width="27%" align="center">0xbd</td>
              </tr>
              <tr>
                <td width="25%" align="center">¥</td>
                <td width="25%" align="center">190</td>
                <td width="23%" align="center">0276</td>
                <td width="27%" align="center">0xbe</td>
              </tr>
              <tr>
                <td width="25%" align="center">+</td>
                <td width="25%" align="center">191</td>
                <td width="23%" align="center">0277</td>
                <td width="27%" align="center">0xbf</td>
              </tr>
            </tbody></table>
            </td>
          <td width="20%">
            <table border="1" width="100%" bordercolor="#000000">
              <tbody><tr>
                <td width="25%" align="center">Caracter</td>
                <td width="25%" align="center"> Dec</td>
                <td width="23%" align="center">Oct</td>
                <td width="27%" align="center"> Hex</td>
              </tr>
              <tr>
                <td width="25%" align="center">+</td>
                <td width="25%" align="center">192</td>
                <td width="23%" align="center">0300</td>
                <td width="27%" align="center">0xc0</td>
              </tr>
              <tr>
                <td width="25%" align="center">-</td>
                <td width="25%" align="center">193</td>
                <td width="23%" align="center">0301</td>
                <td width="27%" align="center">0xc1</td>
              </tr>
              <tr>
                <td width="25%" align="center">-</td>
                <td width="25%" align="center">194</td>
                <td width="23%" align="center">0302</td>
                <td width="27%" align="center">0xc2</td>
              </tr>
              <tr>
                <td width="25%" align="center">+</td>
                <td width="25%" align="center">195</td>
                <td width="23%" align="center">0303</td>
                <td width="27%" align="center">0xc3</td>
              </tr>
              <tr>
                <td width="25%" align="center">-</td>
                <td width="25%" align="center">196</td>
                <td width="23%" align="center">0304</td>
                <td width="27%" align="center">0xc4</td>
              </tr>
              <tr>
                <td width="25%" align="center">+</td>
                <td width="25%" align="center">197</td>
                <td width="23%" align="center">0305</td>
                <td width="27%" align="center">0xc5</td>
              </tr>
              <tr>
                <td width="25%" align="center">ã</td>
                <td width="25%" align="center">198</td>
                <td width="23%" align="center">0306</td>
                <td width="27%" align="center">0xc6</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ã</td>
                <td width="25%" align="center">199</td>
                <td width="23%" align="center">0307</td>
                <td width="27%" align="center">0xc7</td>
              </tr>
              <tr>
                <td width="25%" align="center">+</td>
                <td width="25%" align="center">200</td>
                <td width="23%" align="center">0310</td>
                <td width="27%" align="center">0xc8</td>
              </tr>
              <tr>
                <td width="25%" align="center">+</td>
                <td width="25%" align="center">201</td>
                <td width="23%" align="center">0311</td>
                <td width="27%" align="center">0xc9</td>
              </tr>
              <tr>
                <td width="25%" align="center">-</td>
                <td width="25%" align="center">202</td>
                <td width="23%" align="center">0312</td>
                <td width="27%" align="center">0xca</td>
              </tr>
              <tr>
                <td width="25%" align="center">-</td>
                <td width="25%" align="center">203</td>
                <td width="23%" align="center">0313</td>
                <td width="27%" align="center">0xcb</td>
              </tr>
              <tr>
                <td width="25%" align="center">¦</td>
                <td width="25%" align="center">204</td>
                <td width="23%" align="center">0314</td>
                <td width="27%" align="center">0xcc</td>
              </tr>
              <tr>
                <td width="25%" align="center">-</td>
                <td width="25%" align="center">205</td>
                <td width="23%" align="center">0315</td>
                <td width="27%" align="center">0xcd</td>
              </tr>
              <tr>
                <td width="25%" align="center">+</td>
                <td width="25%" align="center">206</td>
                <td width="23%" align="center">0316</td>
                <td width="27%" align="center">0xce</td>
              </tr>
              <tr>
                <td width="25%" align="center">¤</td>
                <td width="25%" align="center">207</td>
                <td width="23%" align="center">0317</td>
                <td width="27%" align="center">0xcf</td>
              </tr>
              <tr>
                <td width="25%" align="center">ð</td>
                <td width="25%" align="center">208</td>
                <td width="23%" align="center">0320</td>
                <td width="27%" align="center">0xd0</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ð</td>
                <td width="25%" align="center">209</td>
                <td width="23%" align="center">0321</td>
                <td width="27%" align="center">0xd1</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ê</td>
                <td width="25%" align="center">210</td>
                <td width="23%" align="center">0322</td>
                <td width="27%" align="center">0xd2</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ë</td>
                <td width="25%" align="center">211</td>
                <td width="23%" align="center">0323</td>
                <td width="27%" align="center">0xd3</td>
              </tr>
              <tr>
                <td width="25%" align="center">È</td>
                <td width="25%" align="center">212</td>
                <td width="23%" align="center">0324</td>
                <td width="27%" align="center">0xd4</td>
              </tr>
              <tr>
                <td width="25%" align="center">i</td>
                <td width="25%" align="center">213</td>
                <td width="23%" align="center">0325</td>
                <td width="27%" align="center">0xd5</td>
              </tr>
              <tr>
                <td width="25%" align="center">Í</td>
                <td width="25%" align="center">214</td>
                <td width="23%" align="center">0326</td>
                <td width="27%" align="center">0xd6</td>
              </tr>
              <tr>
                <td width="25%" align="center">Î</td>
                <td width="25%" align="center">215</td>
                <td width="23%" align="center">0327</td>
                <td width="27%" align="center">0xd7</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ï</td>
                <td width="25%" align="center">216</td>
                <td width="23%" align="center">0330</td>
                <td width="27%" align="center">0xd8</td>
              </tr>
              <tr>
                <td width="25%" align="center">+</td>
                <td width="25%" align="center">217</td>
                <td width="23%" align="center">0331</td>
                <td width="27%" align="center">0xd9</td>
              </tr>
              <tr>
                <td width="25%" align="center">+</td>
                <td width="25%" align="center">218</td>
                <td width="23%" align="center">0332</td>
                <td width="27%" align="center">0xda</td>
              </tr>
              <tr>
                <td width="25%" align="center">_</td>
                <td width="25%" align="center">219</td>
                <td width="23%" align="center">0333</td>
                <td width="27%" align="center">0xdb</td>
              </tr>
              <tr>
                <td width="25%" align="center">_</td>
                <td width="25%" align="center">220</td>
                <td width="23%" align="center">0334</td>
                <td width="27%" align="center">0xdc</td>
              </tr>
              <tr>
                <td width="25%" align="center">¦</td>
                <td width="25%" align="center">221</td>
                <td width="23%" align="center">0335</td>
                <td width="27%" align="center">0xdd</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ì</td>
                <td width="25%" align="center">222</td>
                <td width="23%" align="center">0336</td>
                <td width="27%" align="center">0xde</td>
              </tr>
              <tr>
                <td width="25%" align="center">_</td>
                <td width="25%" align="center">223</td>
                <td width="23%" align="center">0337</td>
                <td width="27%" align="center">0xdf</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ó</td>
                <td width="25%" align="center">224</td>
                <td width="23%" align="center">0340</td>
                <td width="27%" align="center">0xe0</td>
              </tr>
              <tr>
                <td width="25%" align="center">ß</td>
                <td width="25%" align="center">225</td>
                <td width="23%" align="center">0341</td>
                <td width="27%" align="center">0xe1</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ô</td>
                <td width="25%" align="center">226</td>
                <td width="23%" align="center">0342</td>
                <td width="27%" align="center">0xe2</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ò</td>
                <td width="25%" align="center">227</td>
                <td width="23%" align="center">0343</td>
                <td width="27%" align="center">0xe3</td>
              </tr>
              <tr>
                <td width="25%" align="center">Õ</td>
                <td width="25%" align="center">228</td>
                <td width="23%" align="center">0344</td>
                <td width="27%" align="center">0xe4</td>
              </tr>
              <tr>
                <td width="25%" align="center">Õ</td>
                <td width="25%" align="center">229</td>
                <td width="23%" align="center">0345</td>
                <td width="27%" align="center">0xe5</td>
              </tr>
              <tr>
                <td width="25%" align="center">µ</td>
                <td width="25%" align="center">230</td>
                <td width="23%" align="center">0346</td>
                <td width="27%" align="center">0xe6</td>
              </tr>
              <tr>
                <td width="25%" align="center">Þ</td>
                <td width="25%" align="center">231</td>
                <td width="23%" align="center">0347</td>
                <td width="27%" align="center">0xe7</td>
              </tr>
              <tr>
                <td width="25%" align="center">Þ</td>
                <td width="25%" align="center">232</td>
                <td width="23%" align="center">0350</td>
                <td width="27%" align="center">0xe8</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ú</td>
                <td width="25%" align="center">233</td>
                <td width="23%" align="center">0351</td>
                <td width="27%" align="center">0xe9</td>
              </tr>
              <tr>
                <td width="25%" align="center">Û</td>
                <td width="25%" align="center">234</td>
                <td width="23%" align="center">0352</td>
                <td width="27%" align="center">0xea</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ù</td>
                <td width="25%" align="center">235</td>
                <td width="23%" align="center">0353</td>
                <td width="27%" align="center">0xeb</td>
              </tr>
              <tr>
                <td width="25%" align="center">ý</td>
                <td width="25%" align="center">236</td>
                <td width="23%" align="center">0354</td>
                <td width="27%" align="center">0xec</td>
              </tr>
              <tr>
                <td width="25%" align="center">Ý</td>
                <td width="25%" align="center">237</td>
                <td width="23%" align="center">0355</td>
                <td width="27%" align="center">0xed</td>
              </tr>
              <tr>
                <td width="25%" align="center">¯</td>
                <td width="25%" align="center">238</td>
                <td width="23%" align="center">0356</td>
                <td width="27%" align="center">0xee</td>
              </tr>
              <tr>
                <td width="25%" align="center">´</td>
                <td width="25%" align="center">239</td>
                <td width="23%" align="center">0357</td>
                <td width="27%" align="center">0xef</td>
              </tr>
              <tr>
                <td width="25%" align="center">&nbsp;</td>
                <td width="25%" align="center">240</td>
                <td width="23%" align="center">0360</td>
                <td width="27%" align="center">0xf0</td>
              </tr>
              <tr>
                <td width="25%" align="center">±</td>
                <td width="25%" align="center">241</td>
                <td width="23%" align="center">0361</td>
                <td width="27%" align="center">0xf1</td>
              </tr>
              <tr>
                <td width="25%" align="center">_</td>
                <td width="25%" align="center">242</td>
                <td width="23%" align="center">0362</td>
                <td width="27%" align="center">0xf2</td>
              </tr>
              <tr>
                <td width="25%" align="center">¾</td>
                <td width="25%" align="center">243</td>
                <td width="23%" align="center">0363</td>
                <td width="27%" align="center">0xf3</td>
              </tr>
              <tr>
                <td width="25%" align="center">¶</td>
                <td width="25%" align="center">244</td>
                <td width="23%" align="center">0364</td>
                <td width="27%" align="center">0xf4</td>
              </tr>
              <tr>
                <td width="25%" align="center">§</td>
                <td width="25%" align="center">245</td>
                <td width="23%" align="center">0365</td>
                <td width="27%" align="center">0xf5</td>
              </tr>
              <tr>
                <td width="25%" align="center">÷</td>
                <td width="25%" align="center">24</td>
                <td width="23%" align="center">0366</td>
                <td width="27%" align="center">0xf6</td>
              </tr>
              <tr>
                <td width="25%" align="center">¸</td>
                <td width="25%" align="center">247</td>
                <td width="23%" align="center">0367</td>
                <td width="27%" align="center">0xf7</td>
              </tr>
              <tr>
                <td width="25%" align="center">°</td>
                <td width="25%" align="center">248</td>
                <td width="23%" align="center">0370</td>
                <td width="27%" align="center">0xf8</td>
              </tr>
              <tr>
                <td width="25%" align="center">¨</td>
                <td width="25%" align="center">249</td>
                <td width="23%" align="center">0371</td>
                <td width="27%" align="center">0xf9</td>
              </tr>
              <tr>
                <td width="25%" align="center">·</td>
                <td width="25%" align="center">250</td>
                <td width="23%" align="center">0372</td>
                <td width="27%" align="center">0xfa</td>
              </tr>
              <tr>
                <td width="25%" align="center">¹</td>
                <td width="25%" align="center">251</td>
                <td width="23%" align="center">0373</td>
                <td width="27%" align="center">0xfb</td>
              </tr>
              <tr>
                <td width="25%" align="center">³</td>
                <td width="25%" align="center">252</td>
                <td width="23%" align="center">0374</td>
                <td width="27%" align="center">0xfc</td>
              </tr>
              <tr>
                <td width="25%" align="center">²</td>
                <td width="25%" align="center">253</td>
                <td width="23%" align="center">0375</td>
                <td width="27%" align="center">0xfd</td>
              </tr>
              <tr>
                <td width="25%" align="center">_</td>
                <td width="25%" align="center">254</td>
                <td width="23%" align="center">0376</td>
                <td width="27%" align="center">0xfe</td>
              </tr>
              <tr>
                <td width="25%" align="center">&nbsp;</td>
                <td width="25%" align="center">255</td>
                <td width="23%" align="center">0377</td>
                <td width="27%" align="center">0xff</td>
              </tr>
            </tbody></table>
            </td>
          <td width="10%">&nbsp;</td>
        </tr>
      </tbody></table>
      <table border="0" width="100%">
        <tbody><tr>
          <td width="100%">
            <p align="center"><font color="#000000"><i>Tabela 1:</i>  ASCII</font></p></td>
        </tr>
      </tbody></table>
      <p>&nbsp;
      <table border="0" width="100%">
        <tbody><tr>
          <td width="100%">&nbsp;
            <table border="0" width="100%">
              <tbody><tr>
                <td width="24%"></td>
                <td width="49%">
                  <table border="1" width="100%" bordercolor="#000000">
                    <tbody><tr>
                      <td width="33%" align="center">Nome ASCII</td>
                      <td width="33%" align="center">Descrição</td>
                      <td width="34%" align="center">Representação em C</td>
                    </tr>
                    <tr>
                      <td width="33%" align="center">nul</td>
                      <td width="33%" align="center">null byte</td>
                      <td width="34%" align="center">\0</td>
                    </tr>
                    <tr>
                      <td width="33%" align="center">bel</td>
                      <td width="33%" align="center">bell character</td>
                      <td width="34%" align="center">\a</td>
                    </tr>
                    <tr>
                      <td width="33%" align="center">bs</td>
                      <td width="33%" align="center">backspace</td>
                      <td width="34%" align="center">\b</td>
                    </tr>
                    <tr>
                      <td width="33%" align="center">ht</td>
                      <td width="33%" align="center">horizontal tab</td>
                      <td width="34%" align="center">\t</td>
                    </tr>
                    <tr>
                      <td width="33%" align="center">np</td>
                      <td width="33%" align="center">formfeed</td>
                      <td width="34%" align="center">\f</td>
                    </tr>
                    <tr>
                      <td width="33%" align="center">nl</td>
                      <td width="33%" align="center">newline</td>
                      <td width="34%" align="center">\n</td>
                    </tr>
                    <tr>
                      <td width="33%" align="center">cr</td>
                      <td width="33%" align="center">carriage return</td>
                      <td width="34%" align="center">\r</td>
                    </tr>
                    <tr>
                      <td width="33%" align="center">vt</td>
                      <td width="33%" align="center">vertical tab</td>
                      <td width="34%" align="center">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="33%" align="center">esc</td>
                      <td width="33%" align="center">escape</td>
                      <td width="34%" align="center">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="33%" align="center">sp</td>
                      <td width="33%" align="center">space</td>
                      <td width="34%" align="center">&nbsp;</td>
                    </tr>
                  </tbody></table>
                </td>
                <td width="27%"></td>
              </tr>
            </tbody></table>
            <table border="0" width="100%">
              <tbody><tr>
                <td width="100%">
                  <p align="center"><i><a name="Tabela 2"><font color="#000000">Tabela
                  2</font></a></i></p></td>
              </tr>
            </tbody></table>
            <p>&nbsp;</p>
            <p>&nbsp;</p></td>
        </tr>
      </tbody></table>
  


