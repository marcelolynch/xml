package xPath;

/*
 * MODIFICADO POR LA CATEDRA 2009
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;

import javax.xml.namespace.QName;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

/**
 * JAXP 1.3 XPath API sample.
 * 
 * Basic utility for applying an XPath expression to an input xml file and
 * printing the evaluation result, using JAXP 1.3 XPath API.
 * 
 * Takes 3 arguments: (1) the return type, which is one of the following
 * Strings: num, bool, str, node, nodeset (2) an xml file name (3) an XPath
 * expression to apply to the input document
 * 
 * Examples: java evalxpath string foo.xml /doc/name[1]/@last java evalxpath
 * nodeset foo.xml /doc/name nodeset
 */
public class evalxpath {
	public static void main(String[] args) throws IOException {
		if (args.length != 3) {
			System.err.println("Usage: java evalxpath typetype xml_file xpath_expression ");
			System.err.println("where typetype is one of these tokens: nodeset, node, string, number, boolean");
			return;
		}
		// set the return type
		QName returnType = null;
		if (args[0].equals("number")) {
			returnType = XPathConstants.NUMBER;
		} else if (args[0].equals("boolean")) {
			returnType = XPathConstants.BOOLEAN;
		} else if (args[0].equals("string")) {
			returnType = XPathConstants.STRING;
		} else if (args[0].equals("node")) {
			returnType = XPathConstants.NODE;
		} else if (args[0].equals("nodeset")) {
			returnType = XPathConstants.NODESET;
		} else {
			System.err.println("Invalid return type: " + args[0]);
			return;
		}
		InputSource xml = new InputSource(args[1]);
		String expr = "";
		BufferedReader in = new BufferedReader(new FileReader(args[2]));
		String line;
		while ((line = in.readLine()) != null) {
			expr += line;
		}
		// Create a new XPath
		XPathFactory factory = XPathFactory.newInstance();
		XPath xpath = factory.newXPath();
		Object result = null;
		try {
			// compile the XPath expression
			XPathExpression xpathExpr = xpath.compile(expr);
			// Evaluate the XPath expression against the input document
			result = xpathExpr.evaluate(xml, returnType);
			// Print the result to System.out.
			printResult(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Print the type and value of the evaluation result.
	 */
	static void printResult(Object result) throws Exception {
		if (result instanceof Double) {
			System.out.println("Result type: double");
			System.out.println("---------------------");
			System.out.println("Value: " + result);
		} else if (result instanceof Boolean) {
			System.out.println("Result type: boolean");
			System.out.println("---------------------");
			System.out.println("Value: " + ((Boolean) result).booleanValue());
		} else if (result instanceof String) {
			System.out.println("Result type: String");
			System.out.println("---------------------");
			System.out.println("Value: " + result);
		} else if (result instanceof Node) {
			Node node = (Node) result;
			System.out.println("Result type: Node");
			System.out.println("---------------------");
			printNode(node);
		} else if (result instanceof NodeList) {
			NodeList nodelist = (NodeList) result;
			System.out.println("Result type: NodeList");
			System.out.println("---------------------");
			printNodeList(nodelist);
		}
	}

	/** Decide if the node is text, and so must be handled specially */
	static boolean isTextNode(Node n) {
		if (n == null)
			return false;
		short nodeType = n.getNodeType();
		return nodeType == Node.CDATA_SECTION_NODE
				|| nodeType == Node.TEXT_NODE;
	}

	/** Decide if the node is aatribute, and so must be handled specially */
	static boolean isAttributeNode(Node n) {
		if (n == null)
			return false;
		short nodeType = n.getNodeType();
		return nodeType == Node.ATTRIBUTE_NODE;
	}

	static void printNode(Node node) throws Exception {
		if (isTextNode(node)) {
			System.out.println(node.getNodeValue());
		} else {
			// Set up an identity transformer to use as serializer.
			Transformer serializer = TransformerFactory.newInstance()
					.newTransformer();
			serializer
					.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
			serializer.transform(new DOMSource(node), new StreamResult(
					new OutputStreamWriter(System.out)));
		}
	}

	static void printNodeList(NodeList nodelist) throws Exception {
		Node n;
		// Set up an identity transformer to use as serializer.
		Transformer serializer = TransformerFactory.newInstance()
				.newTransformer();
		serializer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
		for (int i = 0; i < nodelist.getLength(); i++) {
			n = nodelist.item(i);
			if (isTextNode(n)) {
				// DOM may have more than one node corresponding to a
				// single XPath text node. Coalesce all contiguous text nodes
				// at this level
				StringBuffer sb = new StringBuffer(n.getNodeValue());
				for (Node nn = n.getNextSibling(); isTextNode(nn); nn = nn
						.getNextSibling()) {
					sb.append(nn.getNodeValue());
				}
				System.out.print(sb);
			} else if (isAttributeNode(n)) {
				System.out.print(n.getNodeValue().toString());
			} else {
				serializer.transform(new DOMSource(n), new StreamResult(
						new OutputStreamWriter(System.out)));
			}
			System.out.println();
		}
	}

}
